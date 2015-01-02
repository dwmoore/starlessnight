require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'User creates a new route' do

  scenario 'with valid attributes' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit new_route_path
    fill_in 'Starting System', with: 'Some System'
    fill_in 'Starting Dock', with: 'Some Dock'
    fill_in 'Ending System', with: 'Some Other System'
    fill_in 'Ending Dock', with: 'Some Other Dock'
    fill_in 'Distance', with: 17.11
    fill_in 'Commodity', with: 'Gold'
    fill_in 'Buy price', with: 1155
    fill_in 'Sell price', with: 1345
    check 'Make private'
    click_button 'Create Route'

    expect(page).to have_content('Route Saved')
  end

  scenario 'with invalid attributes' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit new_route_path
    fill_in 'Starting System', with: ''
    fill_in 'Starting Dock', with: 'Some Dock'
    fill_in 'Ending System', with: 'Some Other System'
    fill_in 'Ending Dock', with: 'Some Other Dock'
    fill_in 'Distance', with: 17.11
    fill_in 'Commodity', with: 'Gold'
    fill_in 'Buy price', with: 1155
    fill_in 'Sell price', with: 1345
    check 'Make private'
    click_button 'Create Route'

    expect(page).to have_content('Error Detected')
  end
end
