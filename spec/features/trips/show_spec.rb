require 'rails_helper'

RSpec.describe 'As a logged in user' do
  describe 'I can visit a trip show page' do
    it 'to see all details about the trip' do
      user = create(:user, first_name: "Alison")
      trip_1 = create(:trip, user: user, lng: -118.2436849, lat: 34.0522342)
      climb_1 = create(:climb)
      climb_2 = create(:climb)
      climb_3 = create(:climb)
      trip_1.climbs << [climb_1, climb_2, climb_3]
      trip_2 = create(:trip, user: user)
      climb_4 = create(:climb)
      climb_5 = create(:climb)
      climb_6 = create(:climb)
      trip_2.climbs << [climb_4, climb_5, climb_6]

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/profile'

      expect(page).to have_css(".trips")

      within("#trip-#{trip_1.id}") do
        click_link "#{trip_1.name}"
      end

      expect(current_path).to eq("/trips/#{trip_1.id}")

      expect(page).to have_content("#{trip_1.name}")
      expect(page).to have_content("#{trip_1.destination_name}")
      expect(page).to have_content("#{trip_1.destination_address}")

      expect(page).to have_css(".climbs")

      within ".climbs" do
        expect(page).to have_css("#climb-#{climb_1.id}")
        expect(page).to have_link("#{climb_1.name}") #add path later
        expect(page).to have_css("#climb-#{climb_2.id}")
        expect(page).to have_link("#{climb_2.name}")
        expect(page).to have_css("#climb-#{climb_3.id}")
        expect(page).to have_link("#{climb_3.name}")
      end

      expect(page).to have_css(".google-map")
      expect(page).to have_css("#map")
      #expect it to not be empty
    end
    #test somewhere for profile w/ no trips
  end
end
