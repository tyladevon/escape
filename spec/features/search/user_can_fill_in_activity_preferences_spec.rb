require 'rails_helper'

describe "As a logged-in User, after choosing destination and activity" do
  it "can select activity preferences (for climbing) and get back climbing routes" do
    user = create(:user)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    # climb_results = File.read('/fixtures/climb_results.json')
    
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
    
    # stub_request(:get, '/api/v1/suggestion').with(query: { user_info: user_info }).to_return(status: 200, body: json_response)

    click_on "Find Climbs!"
    
    expect(current_path).to eq("/search/climbs")
    
    expect()
    # expect(page).to have_content(climb_results["results"["success"]])
  end  
end