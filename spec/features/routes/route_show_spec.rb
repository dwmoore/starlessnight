require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'User views a route' do

  it 'shows the route' do
    @user = FactoryGirl.create(:user_with_routes, routes_count: 1)
    login_as(@user, scope: :user)
    @route = @user.routes.first
    visit route_path(@route)

    expect(page).to have_content('System One')
  end
end
