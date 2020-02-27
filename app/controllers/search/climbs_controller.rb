class Search::ClimbsController < ApplicationController
  before_action :require_current_user
  
  def new
    @destination = Destination.new(session[:destination])
  end

  # def index
  #   location = session[:destination]
  #   render locals: {
  #     # climb_results: EscapeService.new.get_climb_results(params, location)
  #   }
  # end

end
