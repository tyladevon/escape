require 'rails_helper'

RSpec.describe 'As a logged in user' do
  describe 'I can search for a destination' do
    describe 'and enter my first activity' do
      it 'as climbing' do
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/search'

        expect(page).to have_field("destination")
        fill_in "destination", with: "Los Angeles"

        expect(page).to have_content("Choose your first activity:")
        # expect the page to have the check boxes
        within "#activity-climbing" do
          expect(page).to have_unchecked_field("selected_activity_")
          check "selected_activity_"
        end

        within "#activity-hiking" do
          expect(page).to have_unchecked_field("selected_activity_")
        end

        expect(page).to have_button("Continue")

        click_button "Continue"

        expect(current_path).to eq('/search/climb')

        expect(page).to have_content('Coming Soon!')
      end
    end
  end
end
