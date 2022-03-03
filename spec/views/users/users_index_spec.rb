require 'rails_helper'
RSpec.describe 'Users Page' do
  describe 'shows users' do
    before(:each) do
      @user1 = User.create(name: 'Amy', photo: 'Tom.png', bio: 'bio', posts_counter: 0, email: 'amy@gmail.com',
                           password: 'password', confirmed_at: Time.now)
      @user2 = User.create(name: 'Amy', bio: 'bio',
                           photo: 'Tom.png',
                           email: 'amy@gmail.com', password: 'password', confirmed_at: Time.now)
      @user3 = User.create(name: 'Jerry', bio: 'bio',
                           photo: 'Tom.png',
                           email: 'jerry@gmail.com', password: 'password', confirmed_at: Time.now)
      visit root_path
      fill_in 'Email', with: 'amy@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Shows the username' do
      expect(page).to have_content('Amy')
    end

    it "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('/assets/Tom-5a9e58b49e16acdc1e1977ef1c38c7dd2a0634c4650d4cbb09f43adc7b2cdd4b.png')
      end
    end

    it 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    it "after clicking on the user, it will be redirected to that user's show page" do
      expect(page).to have_content('Number of posts: 0')
      click_on 'Amy'
      expect(page).to have_no_content('Jerry')
    end
  end
end
