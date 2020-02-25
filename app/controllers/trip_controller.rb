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
end 