require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the welcome page' do
    before do
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    it 'I can register and login with Google Oauth' do
      stub_omniauth

      visit '/'

      click_button 'Sign-In with Google'

      user = User.last

      expect(current_path).to eq('/profile')
      expect(page).to have_content("Hello, #{user.first_name}!")
    end

    it 'I can login as a returning user with Google Oauth' do
      stub_omniauth
      user = create(:user, email: "alison.minton@gmail.com")

      visit '/'

      click_button 'Sign-In with Google'

      expect(current_path).to eq('/profile')
      expect(page).to have_content("Helo, #{user.first_name}")
    end
  end
end
