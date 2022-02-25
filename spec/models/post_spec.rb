require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model' do
    subject { Post.new(title: 'New post', text: 'Hi there', user_id: 2) }
    before { subject.save }

    it 'check if the title is not blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'check if the title is not exceeding 250 characters' do
      subject.title = 'Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello
      world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world '
      expect(subject).to_not be_valid
    end

    it 'check if it increases the number of comments' do
      prev_posts_counter = User.find(1).posts_counter
      subject.update_posts_counter
      expect(User.find(1).posts_counter).to eq(prev_posts_counter + 1)
    end

    it 'loads only the recent 5 comments' do
      expect(subject.recent_comments.length).to eq(5)
    end
  end
end
