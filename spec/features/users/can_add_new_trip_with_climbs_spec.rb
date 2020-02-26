feature "User can add new trip with climbs" do
  scenario 'Successful' do 
  # if you need to rebuild the cassette, you must comment the line below in all tests
  # use find_all to locate all tests with ignore cassettes enabled
  # VCR.turn_off! :ignore_cassettes => true
    VCR.use_cassette('create_new_trip_with_climbs') do
      destination = "Boulder"
      selected_climb_1 = "The Shaft"
      selected_climb_2 = "Divination"
      selected_climb_3 = "Mosquito Burrito"
      distance = "10"
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      params = {lat: 40.03,
                lon: -105.25,
                max_dist: 10,
                min_diff: 5.7,
                max_diff: 5.12}

      visit '/search'
      fill_in "destination", with: destination 
      choose 'Climbing'
      click_on "Continue"
      expect(current_path).to eq(search_climbs_new_path)

      select "5.7", from: :min_diff
      select "5.12", from: :max_diff
      select "Sport", from: :type
      fill_in :distance, with: distance
      click_on "Find Climbs!"
      expect(current_path).to eq(trip_new_path)

      find(:css, "#check-box-0").click
      find(:css, "#check-box-3").click
      find(:css, "#check-box-5").click
      click_on 'Save Selected Climbs'

      new_trip = Trip.last
      expect(current_path).to eq(trip_path(new_trip))
      # auto generated trip name
      expect(page).to have_content("Trip Name: Trip 1: #{destination}")
      expect(page).to have_link(selected_climb_1)
      expect(page).to have_link(selected_climb_2)
      expect(page).to have_link(selected_climb_3)
    end
  end

  # test requires selenium -- button is not disabled until mouse over
  # scenario "Not successful" do
  #   VCR.use_cassette('create_new_trip_with_climbs_not_successful') do
  #     destination = "Boulder"
  #     distance = "10"
  #     user = create(:user)
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
  #     params = {lat: 40.03,
  #               lon: -105.25,
  #               max_dist: 10,
  #               min_diff: 5.7,
  #               max_diff: 5.12}

  #     visit '/search'
  #     fill_in "destination", with: destination 
  #     choose 'Climbing'
  #     click_on "Continue"

  #     select "5.7", from: :min_diff
  #     select "5.12", from: :max_diff
  #     select "Sport", from: :type
  #     fill_in :distance, with: distance
  #     click_on "Find Climbs!"
      
  #     expect(page).to have_button('Save Selected Climbs', disabled: true)
  #     find(:css, "#check-box-0").set(true)
  #     expect(page).to have_button('Save Selected Climbs', disabled: false)
  #   end
  # end
end