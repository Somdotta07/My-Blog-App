require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Users Page' do
  feature 'shows users' do
    background do
      visit new_user_session_path
      @user1 = User.create(name: 'Tom', bio: 'bio',
                           photo: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
                           email: 'tom@gmail.com', password: 'password', confirmed_at: Time.now)
      @user2 = User.create(name: 'Amy', bio: 'bio',
                           photo: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
                           email: 'kchenry@gmail.com', password: 'password', confirmed_at: Time.now)
      @user3 = User.create(name: 'Jerry', bio: 'bio',
                           photo: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
                           email: 'jerry@gmail.com', password: 'password', confirmed_at: Time.now)
      within 'form' do
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password
      end
      click_button 'Log in'
    end

    scenario 'Shows the username' do
      expect(page).to have_content @user1.name
      expect(page).to have_content @user2.name
      expect(page).to have_content @user3.name
    end

    scenario "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')
      end
    end

    scenario 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    scenario "after clicking on the user, it will be redirected to that user's show page" do
      click_link @user1.id.to_s
      expect(page).to have_current_path(user_path(@user1.id))
    end
  end
  # rubocop:enable Metrics/BlockLength
end