class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  after_create :generate_api_token
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  def admin?(requested_role)
    role == requested_role.to_s
  end
end
