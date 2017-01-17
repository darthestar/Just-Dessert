require 'rails_helper'

feature 'user can update their information', %Q{
  As an authenticated user
  I want to update my information
  So I can keep my profile info up to date
} do

  scenario 'it allows user to update information' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'Edit Profile'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'newPassword'
    fill_in 'Password confirmation', with: 'newPassword'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'it allows user to delete account' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'Edit Profile'
    click_button 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
  end

end
