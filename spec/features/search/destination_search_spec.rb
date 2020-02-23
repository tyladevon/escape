require 'rails_helper'

RSpec.describe 'As a logged in user' do
  describe 'I can enter a destinaton' do
    describe 'and enter my first activity' do
      it 'as climbing' do

        destination_fixture = File.read('spec/fixtures/los_angeles.json')

        stub_request(:get, "https://escape-app-api.herokuapp.com/api/v1/destination/LosAngeles").
        to_return(status: 200, body: destination_fixture)

        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/search'

        destination = "Los Angeles"
        fill_in "destination", with: destination

        expect(page).to have_content("Choose your first activity:")

        within "#activity-climbing" do
          expect(page).to have_unchecked_field("selected_activity_")
          check "selected_activity_"
        end

        within "#activity-hiking" do
          expect(page).to have_unchecked_field("selected_activity_")
        end

        click_button "Continue"

        expect(current_path).to eq('/search/climbs/new')

        expect(page).to have_content("Destination: #{destination}")
      end
    end

    describe 'if I fail to enter a destination' do
      it 'I am alerted with a flash message and can try again' do
        # WebMock.allow_net_connect!
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        stub_request(:get, "https://escape-app-api.herokuapp.com/api/v1/destination/").
        to_return(status: 404)

        visit '/search'

        destination = ""

        fill_in "destination", with: destination

        within "#activity-climbing" do
          check "selected_activity_"
        end

        click_button "Continue"

        expect(page).to have_content("The destination you entered cannot be found. Please try again.")

        expect(page).to have_button('Continue')

        # within "#activity-climbing" do
        #   expect(page).to have_checked_field("selected_activity_")
        # end
      end
    end

    describe 'if my search returns no results' do
      it 'I am alerted with a flash message and can try again' do

        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        not_a_location_fixture = File.read('spec/fixtures/not_a_location.json')

        stub_request(:get, "https://escape-app-api.herokuapp.com/api/v1/destination/mostdefinitelynotanactuallocation").
        to_return(status: 200, body: not_a_location_fixture)

        visit '/search'

        destination = "most definitely not an actual location"

        fill_in "destination", with: destination

        within "#activity-climbing" do
          check "selected_activity_"
        end

        click_button "Continue"

        expect(page).to have_content("The destination you entered cannot be found. Please try again.")

        expect(page).to have_button('Continue')
      end
    end

    describe 'if I fail to choose an activity' do
      it 'I am alerted with a flash message and can try again' do
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        destination_fixture = File.read('spec/fixtures/los_angeles.json')

        stub_request(:get, "https://escape-app-api.herokuapp.com/api/v1/destination/LosAngeles").
        to_return(status: 200, body: destination_fixture)

        visit '/search'

        destination = "Los Angeles"
        fill_in "destination", with: destination

        expect(page).to have_content("Choose your first activity:")

        within "#activity-climbing" do
          expect(page).to have_unchecked_field("selected_activity_")
          # check "selected_activity_"
        end

        within "#activity-hiking" do
          expect(page).to have_unchecked_field("selected_activity_")
        end

        click_button "Continue"

        expect(page).to have_content("Please select one activity.")
        expect(page).to have_button("Continue")
      end
    end
  end
end
