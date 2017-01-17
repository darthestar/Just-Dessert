def sign_in_as(user)
  # sign in the user
  visit root_path
  click_link 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign In'
end
