require "rails_helper"
require 'database_cleaner'
include Warden::Test::Helpers
Warden.test_mode!
DatabaseCleaner.clean_with :truncation

DatabaseCleaner.strategy = :transaction

feature "User views an index of their routes" do

  it "shows a list of routes" do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start # usually this is called in setup of a test
    @user = FactoryGirl.create(:user_with_routes)
    login_as(@user, :scope => :user)
    visit routes_path

    @user.routes.each do |route|
      expect(page).to have_css("#route_#{route.id}")
    end

    DatabaseCleaner.clean # cleanup of the test
  end
end
