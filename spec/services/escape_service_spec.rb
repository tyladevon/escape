require 'rails_helper'

describe EscapeService do
  describe 'instance methods' do
    describe '#get_destination_info' do
      it 'returns the information for a given destination', :vcr do

        service = EscapeService.new
        destination = "LosAngeles"
        location_info = service.get_destination_info(destination)

        expect(location_info).to be_a Hash
        expect(location_info).to have_key :data
        expect(location_info[:data]).to have_key :attributes
        expect(location_info[:data][:attributes]).to have_key :name
        expect(location_info[:data][:attributes]).to have_key :full_address
        expect(location_info[:data][:attributes]).to have_key :latitude
        expect(location_info[:data][:attributes]).to have_key :longitude
      end
    end

    describe "#get_hike_results" do
      it "returns the hikes with given parameters", :vcr do
        service = EscapeService.new
        params = {"max_dist" => 1,
                  "max_results" => 3,
                  "min_stars" => 0}
        lat = 40.03
        lng = -105.25

        hikes_info = service.get_hike_results(params, lat, lng)

        expect(hikes_info.length).to eq(3)
        expect(hikes_info.first).to have_key :name
        expect(hikes_info.first).to have_key :rid
        expect(hikes_info.first).to have_key :type
        expect(hikes_info.first).to have_key :summary
        expect(hikes_info.first).to have_key :difficulty
        expect(hikes_info.first).to have_key :stars
        expect(hikes_info.first).to have_key :location
        expect(hikes_info.first).to have_key :length
        expect(hikes_info.first).to have_key :ascent
        expect(hikes_info.first).to have_key :descent
        expect(hikes_info.first).to have_key :longitude
        expect(hikes_info.first).to have_key :latitude
        expect(hikes_info.first).to have_key :url
        expect(hikes_info.first).to have_key :high
        expect(hikes_info.first).to have_key :low
      end
    end
  end
end
