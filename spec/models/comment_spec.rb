require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    subject { Comment.new(text: 'Good job', user_id: 1, post_id: 2) }

    before { subject.save }

    it 'check if it increases the number of comments' do
      prev_comments_counter = Post.find(1).comments_counter
      subject.update_comments_counter
      expect(Post.find(1).comments_counter).to eq(prev_comments_counter + 1)
    end
  end
end
