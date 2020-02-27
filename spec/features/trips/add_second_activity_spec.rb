require 'rails_helper'

RSpec.describe 'As a logged in user' do
  describe 'if I have created a trip that has climbs' do
    it 'I can add hikes to my trip', :vcr do
      user = create(:user, first_name: "Alison")
      trip_1 = create(:trip, user: user, lng: -118.2436849, lat: 34.0522342)
      climb_1 = Climb.create!(route_id: 106080329,
                  name: "The Peacemaker",
                  climb_type: "Sport",
                  rating: "5.10a",
                  stars: 4.5,
                  pitches: 7,
                  url: "https://www.mountainproject.com/route/106080329/the-peacemaker",
                  lat: 34.2709,
                  lng: -118.6781,
                  location: "Test Location 1")

      climb_2 = Climb.create!(route_id: 106627453,
                  name: "The Guillotine",
                  climb_type: "Sport",
                  rating: "5.10a/b",
                  stars: 4.4,
                  pitches: 1,
                  url: "https://www.mountainproject.com/route/106627453/the-guillotine",
                  lat: 34.1495,
                  lng: -118.7858,
                  location: "Test Location 2")

      trip_1.climbs << [climb_1, climb_2]

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trip_path(trip_1.id)

      within '.climbs' do
        expect(page).to have_link(climb_1.name)
        expect(page).to have_link(climb_2.name)
      end

      within '.hikes' do
        expect(page).to have_content('You have not added any hikes yet.')
      end

      click_button 'Add Hikes'

      expect(current_path).to eq("/trips/#{trip_1.id}/search/hikes")

      expect(page).to have_content(trip_1.destination_name)

      fill_in "distance", with: 1
      fill_in "max_results", with: 3
      fill_in 'min_stars', with: 0

      click_button "Find Hikes"

      expect(current_path).to eq("/trips/#{trip_1.id}/search/hikes/index")

      expect(page).to have_css(".hike", count: 3)
      expect(page).to have_content("3 results")

      check "check-box-0"

      expect do
        click_button "Save Selected Hikes"
      end.
      to change { Hike.count}.by(1).and change { Trip.count}.by(0)

      hike = Hike.last

      expect(current_path).to eq("/trips/#{trip_1.id}")

      expect(page).to have_css(".hikes")

      within(".hikes") do
        expect(page).to have_css(".hike", count: 1)

        within("#hike-#{Hike.last.id}") do
          expect(page).to have_link("#{hike.name}", href: hike.url)
          expect(page).to have_content(hike.summary)
          expect(page).to have_content(hike.stars)
          expect(page).to have_content(hike.difficulty)
          expect(page).to have_content(hike.high)
          expect(page).to have_content(hike.length)
          expect(page).to have_content(hike.ascent)
        end
      end
    end
  end
end
