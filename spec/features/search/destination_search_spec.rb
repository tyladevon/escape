require 'rails_helper'

RSpec.describe 'As a logged in user' do
  describe 'I can enter a destinaton' do
    describe 'and enter my first activity' do
      it 'as climbing' do
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
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/search'

        destination = nil

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
      xit 'I am alerted with a flash message and can try again' do

      end
    end

    describe 'if I fail to choose an activity' do
      xit 'I am alerted with a flash message and can try again' do

      end
    end
  end
end
