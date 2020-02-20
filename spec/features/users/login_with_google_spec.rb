require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the welcome page' do
    it 'I can login with Google Oauth' do
      visit '/'

      click_button 'Sign-In with Google'

      expect(current_path).to eq('/profile')
      expect(page).to have_content('Welcome!')
    end
  end
end
