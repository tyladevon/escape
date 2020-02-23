require 'rails_helper'

describe "As a logged-in User, after choosing destination and activity" do
  it "can select activity preferences (for climbing) and get back climbing routes" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    destination_fixture = File.read('spec/fixtures/los_angeles.json')

    stub_request(:get, "https://escape-app-api.herokuapp.com/api/v1/destination/LosAngeles").
    to_return(status: 200, body: destination_fixture)

    climb_results = File.read('spec/fixtures/climb_results.json')

    stub_request(:get, "https://escape-app-api.herokuapp.com/api/v1/climb_results?lat=34.0522342&lon=-118.2436849&max_dist=10&min_diff=5.7&max_diff=5.12").to_return(status: 200, body: climb_results)

    visit '/search'

    fill_in "destination", with: "Los Angeles"

    within "#activity-climbing" do
      expect(page).to have_unchecked_field("selected_activity_")
      check "selected_activity_"
    end

    click_button "Continue"

    expect(current_path).to eq('/search/climbs/new')

    select "5.7", from: :min_diff
    select "5.12", from: :max_diff
    select "Sport", from: :type
    fill_in :distance, with: "10"


    click_on "Find Climbs!"

    expect(current_path).to eq("/search/climbs")

    expect()
    # expect(page).to have_content(climb_results["results"["success"]])
  end
end
