require 'rails_helper'

describe EscapeService do
  describe 'instance methods' do
    describe '#get_destination_info' do
      it 'returns the information for a given destination' do
        WebMock.allow_net_connect!

        service = EscapeService.new
        destination = "LosAngeles"
        location_info = service.get_destination_info(destination)

        expect(location_info).to be_a Hash
        expect(location_info).to have_key :formatted_address
        expect(location_info).to have_key :geometry
        expect(location_info).to have_key :name
        expect(location_info[:geometry]).to have_key :location
        expect(location_info[:geometry][:location]).to have_key :lat
        expect(location_info[:geometry][:location]).to have_key :lng
      end
    end
  end
end
