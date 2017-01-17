require 'rails_helper'

feature 'user signs out', %Q{
  As a user
  I want to sign out
  So no one else can take action on my posts or reviews on my behalf
} do

  scenario 'it allows user to sign out' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'Sign Out'

    expect(page).to have_content('Sign In')
    expect(page).to have_content('Goodbye!')

  end
end
