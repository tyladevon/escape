require 'rails_helper'

feature "Require current user" do
  scenario "Successful" do
    visit '/profile'
    expect(current_path).to eq('/')

    visit '/search'
    expect(current_path).to eq('/')

    visit '/climbs/trips/new'
    expect(current_path).to eq('/')

    visit '/hikes/trips/new'
    expect(current_path).to eq('/')

    visit '/trips/200'
    expect(current_path).to eq('/')

    visit '/search/climbs/new'
    expect(current_path).to eq('/')

    visit '/search/hikes/new'
    expect(current_path).to eq('/')
  end
end