require 'rails_helper'

RSpec.describe Climb, type: :model do
  describe 'validations' do
    it { should validate_presence_of :route_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :climb_type }
    it { should validate_presence_of :rating }
    it { should validate_presence_of :stars }
    it { should validate_numericality_of :stars }
    it { should validate_presence_of :pitches }
    it { should validate_numericality_of :pitches }
    it { should validate_presence_of :lat }
    it { should validate_numericality_of :lat }
    it { should validate_presence_of :lng }
    it { should validate_numericality_of :lng }
    it { should validate_presence_of :url }
  end

  describe 'relationships' do
    it { should have_many :trip_climbs }
    it { should have_many(:trips).through(:trip_climbs) }
  end

  describe 'attributes' do
    it 'has attributes' do
      climb_info = {
                      "id": 105876832,
                      "name": "Shark's Fin Arete",
                      "type": "Sport",
                      "rating": "5.7",
                      "stars": 3.6,
                      "starVotes": 277, #do we want star votes?
                      "pitches": 1,
                      "url": "https://www.mountainproject.com/route/105876832/sharks-fin-arete",
                      "longitude": -118.372,
                      "latitude": 33.9324
                    }

      climb = Climb.create!(route_id: climb_info[:id],
                            name: climb_info[:name],
                            climb_type: climb_info[:type],
                            rating: climb_info[:rating],
                            stars: climb_info[:stars],
                            pitches: climb_info[:pitches],
                            url: climb_info[:url],
                            lat: climb_info[:latitude],
                            lng: climb_info[:longitude],
                            )

      expect(climb).to be_a Climb
      expect(climb.route_id).to eq(105876832)
      expect(climb.name).to eq("Shark's Fin Arete")
      expect(climb.climb_type).to eq("Sport")
      expect(climb.rating).to eq("5.7")
      expect(climb.stars).to eq(3.6)
      expect(climb.pitches).to eq(1)
      expect(climb.lat).to eq(33.9324)
      expect(climb.lng).to eq(-118.372)
      expect(climb.url).to eq("https://www.mountainproject.com/route/105876832/sharks-fin-arete")
    end
  end
end
