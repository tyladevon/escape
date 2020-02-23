require 'rails_helper'

RSpec.describe Destination do
  it 'exists with attributes' do
    destination_info = {
                        "name"=>"Los Angeles",
                        "address"=>"Los Angeles, CA, USA",
                        "lat"=>34.0522342,
                        "lng"=>-118.2436849}

    destination = Destination.new(destination_info)

    expect(destination).to be_a Destination
    expect(destination.name).to eq("Los Angeles")
    expect(destination.address).to eq("Los Angeles, CA, USA")
    expect(destination.lat).to eq(34.0522342)
    expect(destination.lng).to eq(-118.2436849)
  end
end
