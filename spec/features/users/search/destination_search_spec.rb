require 'rails_helper'

RSpec.describe 'As a logged in user' do
  describe 'I can search for a destination' do
    describe 'and enter my first activity' do
      it 'from the search page' do
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/search'

        expect(page).to have_field("destination")
        expect(page).to have_button("Continue")
        expect(page).to have_content("Choose your first activity:")
        # expect the page to have the check boxes
        expect(page).to have_unchecked_field("climbing")
        expect(page).to have_unchecked_field("hiking")
      end 
    end
  end
end
