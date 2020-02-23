require 'rails_helper'

RSpec.describe TripClimb, type: :model do
  describe 'validations' do
    it { validates_presence_of :trip_id}
    it { validates_presence_of :climb_id}
  end

  describe 'relationships' do
    it { belongs_to :trip}
    it { belongs_to :climb}
  end
end
