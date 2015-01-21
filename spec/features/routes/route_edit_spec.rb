require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'User edits a route' do

  scenario 'with valid attributes' do
    @user = FactoryGirl.create(:user_with_routes)
    login_as(@user, scope: :user)
    @route = @user.routes.first
    visit edit_route_path(@route)
    fill_in 'route_cargo_capacity', with: 65
    click_button 'Update Route'

    expect(page).to have_content('Route Updated')

  end

  scenario 'with invalid attributes' do
    @user = FactoryGirl.create(:user_with_routes)
    login_as(@user, scope: :user)
    @route = @user.routes.first
    visit edit_route_path(@route)
    fill_in 'Starting System', with: ''
    click_button 'Update Route'

    expect(page).to have_content('Error Detected')

  end
end
