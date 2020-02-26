class Hikes::TripsController < ApplicationController

  def new
    lat = session[:destination]["lat"]
    lng = session[:destination]["lng"]
    all_hikes = EscapeService.new.get_hike_results(params, lat, lng)

    @hike_options = all_hikes.map do |hike_response|
      HikeOption.new(hike_response)
    end
  end

end
