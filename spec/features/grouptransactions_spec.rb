require 'rails_helper'

RSpec.feature "Grouptransactions", type: :feature do

  fixtures :users
  fixtures :groups 
  context "user should be able to create a group transaction" do
     setup do 
      sign_in(users(:salley))
     end
    scenario "logged user can create a group transaction" do 
      visit "group_transactions/new?id=1"
      within('form') do
        fill_in 'name', with: "test"
        fill_in 'amount', with: 50
        find_button('Add Transaction').click
        expect(page).to have_http_status(200)
      end
    end
  end
end
