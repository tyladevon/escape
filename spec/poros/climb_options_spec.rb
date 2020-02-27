require 'rails_helper'

describe ClimbOptions do 
  it "has attributes" do
    climbing_route_option = {name: "The Nose",
                             type: "Trad",
                             rating: "5.13",
                             stars: 4.5,
                             pitches: 5,
                             location: ["Boulder, Colorado"],
                             url: "https://www.mountainproject.com/route/105924807/the-nose",
                             longitude: -105.2942,
                             latitude: 40.0207,
                           }

    climb_options = ClimbOptions.new(climbing_route_option)

    expect(climb_options.name).to eq("The Nose")
    expect(climb_options.climb_type).to eq("Trad")
    expect(climb_options.rating).to eq("5.13")
    expect(climb_options.stars).to eq(4.5)
    expect(climb_options.pitches).to eq(5)
    expect(climb_options.location).to eq("Boulder, Colorado")
    expect(climb_options.url).to eq("https://www.mountainproject.com/route/105924807/the-nose")
    expect(climb_options.longitude).to eq(-105.2942)
    expect(climb_options.latitude).to eq(40.0207)
  end
end