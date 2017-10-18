require 'rails_helper'

RSpec.feature "User can search" do
  scenario "by zipcode" do
    VCR.use_cassette('fuel_stations') do
  #As a user
  #When I visit "/"
      visit "/"
  #And I fill in the search form with 80203
      fill_in 'q', with: '80203'
  #And I click "Locate"
      click_on "Locate"
  #Then I should be on page "/search" with parameters visible in the url
      expect(current_path).to eq("/search")
  #Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      expect(page).to have_css('h3.station', count: 10)
  #And the stations should be limited to Electric and Propane
  #And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      expect(page).to have_css('li.name', count: 10)
      expect(page).to have_css('li.address', count: 10)
      expect(page).to have_css('li.fuel_types', count: 10)
      expect(page).to have_css('li.distance', count: 10)
      expect(page).to have_css('li.access_times', count: 10)
    end
  end
end
