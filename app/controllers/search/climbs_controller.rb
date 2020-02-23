class Search::ClimbsController < ApplicationController

  def new
    @destination = Destination.new(session[:destination])
  end

  def create
    location = session[:destination]

    EscapeService.new.get_climb_results(params, location)
    redirect_to "/search/climbs"
  end

end
