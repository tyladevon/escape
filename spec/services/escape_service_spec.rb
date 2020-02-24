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
  end
end
