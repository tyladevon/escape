class Search::ClimbsController < ApplicationController

  def new
    @destination = Destination.new(session[:destination])
  end

  def create
    response = Faraday.get("https://escape-app-api.herokuapp.com/api/v1/climb_results") do |req|
      req[:lat] = params[:lat]
      req[:lon] = params[:lon]
      req[:max_dist] = params[:max_dist]
      req[:min_diff] = params[:min_diff]
      req[:max_diff] = params[:max_diff]
    end
    binding.pry

  end
end
