class TripsController < ApplicationController
  before_action :require_current_user

  def show
    @trip = Trip.find(params[:id])
  end
end
