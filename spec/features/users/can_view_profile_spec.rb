require 'rails_helper'

describe "As a User" do
  describe "When I have logged in successfully" do
    it "I am on the profile page and can see a button 'Start a New Trip'" do
      user = create(:user)
     
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit '/profile'
            
      click_on 'Start a New Trip'

      expect(current_path).to eq('/search')
    end 
  end 
  describe "When I am not logged in" do
    describe "I try to visit the profile page" do
      it "I am redirected to log in page and see a 'Please log in to continue' message" do
        visit '/profile'
        expect(current_path).to eq('/')
        expect(page).to have_content("Please log in to continue")
      end
    end
  end
end 
