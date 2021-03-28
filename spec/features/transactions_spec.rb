require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  fixtures :users
  fixtures :transactions
  context 'user should be able to create a group transaction' do
    setup do
      sign_in(users(:salley))
    end
    scenario 'logged user can create a group transaction' do
      visit '/transactions/new'
      within('form') do
        fill_in 'transaction[name]', with: 'test'
        fill_in 'transaction[amount]', with: 50
        find_button('Add Transaction').click
        expect(page).to have_http_status(200)
      end
    end

    scenario 'logged user can create a group transaction' do
      visit '/transactions/new'
      within('form') do
        fill_in 'transaction[name]', with: nil
        fill_in 'transaction[amount]', with: nil
        find_button('Add Transaction').click
      end
      expect(page).to have_http_status(200)
      expect(page).to have_text(/Error adding transaction/)
    end
  end
end
