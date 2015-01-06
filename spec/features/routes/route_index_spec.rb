require "rails_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "User views an index of their routes" do

  it "shows a list of routes" do
    @user = FactoryGirl.create(:user_with_routes)
    login_as(@user, :scope => :user)
    visit routes_path

    expect(page).to have_css('#route_1')
    expect(page).to have_css('#route_2')
    expect(page).to have_css('#route_3')
    expect(page).to have_css('#route_4')
    expect(page).to have_css('#route_5')
  end
end
