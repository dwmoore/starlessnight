require 'rails_helper'

# Feature: Route index page
#   As a user
#   I want to see an index of my routes
#   So I may manage the individual entries

feature 'Visiting route index page' do

  context 'as a user' do
    it 'shows a welcome message' do
      user = FactoryGirl.create(:user, :with_routes)
      visit('routes#index')

      expect(page).to have_content(user.routes.first.id)
    end
  end

  context 'as a user' do
    it 'shows a list of routes' do

    end
  end
end
