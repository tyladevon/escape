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

    click_button "Find Hikes"

    expect(current_path).to eq("/trips/hikes/new")

    expect(page).to have_content("Hike Name")
    expect(page).to have_button("Save Selected Hikes")
    click_button "Save Selected Hikes"

    trip = Trip.last

    expect(current_path).to eq("/trips/#{trip.id}")

    expect(page).to have_css(".hikes")

  end
end
