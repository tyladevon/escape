require 'rails_helper'

RSpec.describe TripClimb, type: :model do
  describe 'validations' do
    it { should validate_presence_of :trip_id}
    it { should validate_presence_of :climb_id}
  end

  describe 'relationships' do
    it { should belong_to :trip}
    it { should belong_to :climb}
  end

  describe 'attributes' do
    it 'has attributes' do
      trip = create(:trip)
      climb = create(:climb)
      trip_climb = TripClimb.create!(trip: trip, climb: climb)

      expect(trip_climb.trip_id).to eq(trip.id)
      expect(trip_climb.climb_id).to eq(climb.id)
    end
  end
end
