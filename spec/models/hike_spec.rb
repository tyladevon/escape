require 'rails_helper'

RSpec.describe Hike, type: :model do
  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :url}
    it {should validate_presence_of :lat}
    it {should validate_presence_of :lng}
  end

  describe "Relationships" do
    it {should belong_to :trip}
  end
end
