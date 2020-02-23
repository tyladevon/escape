class Search::ClimbsController < ApplicationController

  def new
    @destination = Destination.new(session[:destination])
  end

  def create
    binding.pry
    # response = Faraday.get("https://escape-app-api.herokuapp.com/api/v1/climb_results") do |req|
      # req[:lat] = params[@]
  end 
end
