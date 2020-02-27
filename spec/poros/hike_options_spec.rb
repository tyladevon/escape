require 'rails_helper'

RSpec.describe HikeOption do
  it "it exists with attributes" do
    hike_info = {name: "Dakota Ridge to Sanitas Valley Loop",
                  rid: 7006781,
                  summary: "A technical ascent with a great view of Boulder, followed by a nice, open downhill pitch.",
                  difficulty: "greenBlue",
                  stars: 4,
                  location: "Boulder, Colorado",
                  length: 2.3,
                  ascent: 458,
                  longitude: -105.2942,
                  latitude: 40.0207,
                  url: "https://www.hikingproject.com/trail/7006781/dakota-ridge-to-sanitas-valley-loop",
                  high: 5961
                }

    hike_options = HikeOption.new(hike_info)

    expect(hike_options.name).to eq("Dakota Ridge to Sanitas Valley Loop")
    expect(hike_options.summary).to eq("A technical ascent with a great view of Boulder, followed by a nice, open downhill pitch.")
    expect(hike_options.difficulty).to eq("greenBlue")
    expect(hike_options.rid).to eq(7006781)
    expect(hike_options.stars).to eq(4)
    expect(hike_options.location).to eq("Boulder, Colorado")
    expect(hike_options.length).to eq(2.3)
    expect(hike_options.ascent).to eq(458)
    expect(hike_options.lng).to eq(-105.2942)
    expect(hike_options.lat).to eq(40.0207)
    expect(hike_options.url).to eq("https://www.hikingproject.com/trail/7006781/dakota-ridge-to-sanitas-valley-loop")
    expect(hike_options.max_elevation).to eq(5961)
  end
end
