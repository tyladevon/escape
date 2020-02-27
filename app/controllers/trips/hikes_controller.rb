class Trips::HikesController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
  end

  def index
    @trip = Trip.find(params[:trip_id])

    lat = @trip.lat
    lng = @trip.lng
    all_hikes = EscapeService.new.get_hike_results(params, lat, lng)
    @hike_options = all_hikes.map do |hike_response|
      HikeOption.new(hike_response)
    end
  end

  def create
    trip = Trip.find(params[:trip_id])

    hikes = params["hike_objects"]

    hikes.each do |hike|
      parsed_hike = JSON.parse(hike)
      trip.hikes.create!(
        name: parsed_hike["name"],
        url: parsed_hike["url"],
        lat: parsed_hike["lat"],
        lng: parsed_hike["lng"],
        summary: parsed_hike["summary"],
        difficulty: parsed_hike["difficulty"],
        stars: parsed_hike["stars"],
        location: parsed_hike["location"],
        length: parsed_hike["length"],
        ascent: parsed_hike["ascent"],
        high: parsed_hike["max_elevation"]
      )

    end
    redirect_to trip_path(trip)
  end
end
