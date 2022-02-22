class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, foreign_key: 'post_id'

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
