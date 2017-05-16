require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Rachel',
      last_name: 'Green',
      email: 'rachel@gmail.com',
      password: 'rossgeller'
    )
  end

  scenario "Users can login successfully, are taken to the home page once signed in" do
    visit new_session_path
    within 'form' do
      fill_in id: 'email', with: @user.email
      fill_in id: 'password', with: @user.password

      click_button 'Submit'
    end

    save_screenshot

    within '#navbar' do
      expect(page).to have_content 'Logout'
    end
  end
end
