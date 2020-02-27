require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :destination_name}
    it { should validate_presence_of :destination_address}
    it { should validate_presence_of :lat}
    it { should validate_presence_of :lng}
    it { should validate_numericality_of :lng}
    it { should validate_numericality_of :lng}
  end

  describe 'relationships' do
    it { should belong_to :user}
    it { should have_many :trip_climbs}
    it { should have_many(:climbs).through(:trip_climbs)}
    it {should have_many :hikes}
  end

  describe 'attributes' do
    it 'has attributes' do
      user = create(:user)
      trip = Trip.create!(name: "LA Trip",
                          destination_name: "Los Angeles",
                          destination_address: "Los Angeles, CA, USA",
                          lat: 34.0522342,
                          lng: -118.2436849,
                          user: user)

      expect(trip.name).to eq("LA Trip")
      expect(trip.destination_name).to eq("Los Angeles")
      expect(trip.destination_address).to eq("Los Angeles, CA, USA")
      expect(trip.lat).to eq(34.0522342)
      expect(trip.lng).to eq(-118.2436849)
    end
  end
end
