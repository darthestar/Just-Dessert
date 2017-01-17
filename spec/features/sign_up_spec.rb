require 'rails_helper'

feature 'user signs up',  %Q{
  As an unathenticated user
  I want to sign up
  So that I can view desserts reviews
} do

  scenario ' specifying valid and required information' do
    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: 'Jake'
    fill_in 'Last Name', with: 'Malcolm'
    fill_in 'Email', with: 'jmalcolm@example.com'
    fill_in 'user_password', with: 'password'
    fill_in "Password Confirmation", with: 'password'
    click_button 'Sign In'

    expect(page).to have_content("You're in!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do

  visit root_path
  click_link 'Sign Up'
  click_button 'Sign In'

  expect(page).to have_content("can't be blank")
  expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match confirmation' do
     visit root_path
     click_link 'Sign Up'
     fill_in 'user_password', with: 'password'
     fill_in 'Password Confirmation', with: 'somethingDifferent'
     click_button 'Sign In'

     expect(page).to have_content("doesn't match")
     expect(page).to_not have_content("Sign Out")

  end


end
