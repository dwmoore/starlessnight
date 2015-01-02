require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'User deletes a route' do

  it 'deletes the route', :js => true do
    @user = FactoryGirl.create(:user_with_routes, routes_count: 2)
    login_as(@user, scope: :user)
    @route = @user.routes.first
    visit route_path(@route)
    click_link 'Delete Route'
    accept_confirm

    expect(page).to have_content('Route Destroyed')
    expect(@user.routes.count).to eq(1)

  end
end
