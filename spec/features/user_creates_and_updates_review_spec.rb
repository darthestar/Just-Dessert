require 'rails_helper'

feature 'user can add and view a dessert', %Q{
  As a user of the dessert review site
  I want to be able to add a dessert to be reviewed
} do

  context "user is signed in" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
    end

    scenario "lets user create dessert to be reviewed" do
      visit new_dessert_path
      fill_in 'Dessert Name', with: "Tiramisu"
      fill_in 'Dessert Description', with: "Delicious!"
      click_button 'Submit'

      expect(page).to have_content("List of Desserts")
      expect(page).to have_link("Tiramisu")
    end

    scenario "user tries to create dessert with missing information" do
      visit new_dessert_path
      fill_in 'Dessert Name', with: "Tiramisu"
      fill_in 'Dessert Description', with: ""
      click_button 'Submit'

      expect(page).to have_content("Create a New Dessert")
      expect(page).to have_content("Description can't be blank")

    end
  end

  context "user is not signed in" do
    scenario "user can't visit 'create dessert' page" do
      visit new_dessert_path

      expect(page).to_not have_content("Dessert Name")
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end
end


# scenario "lets user view all desserts" do
#   dessert = FactoryGirl.create(:dessert)
#   visit new_user_dessert_path
#   fill_in 'Dessert Name', with: dessert.name
#   fill_in 'Description', with: dessert.description
#   click_button 'Submit'
#
#   expect(page).to have_content(dessert.name)
#   expect(page).to have_content('Sign Out')
#
# end
