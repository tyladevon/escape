require 'rails_helper'

RSpec.describe "Hikes" do
  it "can do hikes", :vcr do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/search'

    fill_in "destination", with: "Boulder"

    choose "Hiking"

    click_button "Continue"

    expect(current_path).to eq("/search/hikes/new")
    expect(page).to have_content("Boulder")

    fill_in "distance", with: 1
    fill_in "max_results", with: 3


    click_button "Find Hikes"

    expect(current_path).to eq("/hikes/trips/new")

    expect(page).to have_content("Dakota Ridge to Sanitas Valley Loop")
    expect(page).to have_content("Mount Sanitas Loop")
    expect(page).to have_content("Sunshine Lion's Lair Loop")
    expect(page).to have_css(".hike", count: 3)
    expect(page).to have_button("Save Selected Hikes")

    check "check-box-0"
    check "check-box-1"
    check "check-box-2"

    click_button "Save Selected Hikes"

    trip = Trip.last

    expect(current_path).to eq("/trips/#{trip.id}")

    expect(page).to have_css(".hikes")

    within(".hikes") do
      expect(page).to have_css(".hike", count: 3)
    end
  end
end
