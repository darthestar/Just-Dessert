require 'rails_helper'

feature 'user can review a dessert', %Q{
  As a user
  I want to write a review
  So I can give my opinion on a dessert someone posted
} do

  context 'user is signed in' do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
  end

    scenario 'it allows a user to post a review'  do
      @dessert = FactoryGirl.create(:dessert)
      visit new_dessert_review_path(@dessert)
      fill_in 'Dessert Review', with: 'I tried this and agree it is wonderful'
      click_button 'Submit'

      expect(page).to have_content('I tried this and agree it is wonderful')
    end

    scenario 'it allows a user to view reviews on a dessert' do
      visit new_dessert_path
      fill_in 'Dessert Name', with: "Tiramisu"
      fill_in 'Dessert Description', with: "Delicious!"
      click_button 'Submit'
      visit desserts_path
      click_link('Tiramisu')

      expect(page).to have_content('Reviews on Tiramisu:')
      expect(page).to have_button('Add a Review')
    end
  end
end
