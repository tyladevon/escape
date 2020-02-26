class TripController < ApplicationController 

  def new
    @location = session[:destination]
    if params["min_diff"] < params["max_diff"]
      flash[:error] = "Please ensure your minimium difficulty is less than your maximum difficulty in your selection preferences"
      redirect_to '/search/climbs/new'
    elsif params["distance"].to_i <= 0
      flash[:error] = "Please fill in a distance of atleast 1 and try your search again!"
      redirect_to '/search/climbs/new'
    else
    render locals: {
      climb_results: EscapeFacade.new(params, @location).climb_options
    }
    end
  end 
  
  def create
    destination = session["destination"]
    new_trip = current_user.trips.create(
      name: "Trip #{current_user.trips.count + 1}: #{destination["name"]}",
      destination_name: destination["name"],
      destination_address: destination["address"],
      lat: destination["lat"],
      lng: destination["lng"]
    )
    params["climb_objects"].each do |climb|
      parsed_climb = JSON.parse(climb)
      new_trip.climbs.create(
        name: parsed_climb["name"],
        rating: parsed_climb["rating"],
        stars: parsed_climb["stars"],
        pitches: parsed_climb["pitches"],
        location: parsed_climb["location"],
        lat: parsed_climb["latitude"],
        lng: parsed_climb["longitude"],
        climb_type: parsed_climb["climb_type"],
        url: parsed_climb["url"]
      )
    end
    redirect_to trip_path(new_trip)
  end
end
