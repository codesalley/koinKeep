require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Groups', type: :feature do
  # rubocop:enable Metrics/BlockLength
  fixtures :users
  fixtures :groups
  setup do
    sign_in(users(:salley))
  end
  context 'user can create group with name and icon' do
    scenario 'user can create a new group and name must not be blank or already exsisting' do
      visit new_group_url
      within('form') do
        fill_in 'group_name', with: 'Utility'
        find_button('Create Group').click
        expect(current_path).to eq('/groups')
        expect(page).to have_http_status(200)
      end
    end
    scenario 'when group already exist it should redirect to new page' do
      visit new_group_url
      within('form') do
        fill_in 'group_name', with: 'Utility'
        find_button('Create Group').click
        expect(current_path).to eq('/groups')
        expect(page).to have_http_status(200)
      end
      visit new_group_url
      within('form') do
        fill_in 'group_name', with: 'Utility'
        find_button('Create Group').click
        expect(current_path).to eq('/groups/new')
        expect(page).to have_http_status(200)
      end
    end
  end
end
