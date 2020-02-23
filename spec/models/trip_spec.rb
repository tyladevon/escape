require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :destination_name}
    it { should validate_presence_of :destination_address}
    it { should validate_presence_of :lat}
    it { should validate_presence_of :lng}
  end

  describe 'relationships' do
    it { belongs_to :user}
    it { has_many :trip_climbs}
    it { has_many(:climbs).through(:trip_climbs)}
  end
end
