class Search::ClimbsController < ApplicationController
  def new
    @destination = Destination.new(session[:destination]) 
  end
end
