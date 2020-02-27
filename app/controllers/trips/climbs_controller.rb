class Trips::ClimbsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
  end

  def index
    @trip = Trip.find(params[:trip_id])

    
  end
end
