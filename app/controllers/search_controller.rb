class SearchController < ApplicationController
  def new
    @activities = ["climbing", "hiking"]
  end

  def create
    destination = params[:destination].delete(' ')

    destination_info = EscapeService.new.get_destination_info(destination)
    if destination_info == 404 || destination_info.nil?
      flash[:notice] = "The destination you entered cannot be found. Please try again."
      @activities = ["climbing", "hiking"]
      render :new
    elsif params[:selected_activity].nil?
      flash[:notice] = "Please select one activity."
      @activities = ["climbing", "hiking"]
      render :new
    else
      name = destination_info[:name]
      address = destination_info[:formatted_address]
      lat = destination_info[:geometry][:location][:lat]
      lng = destination_info[:geometry][:location][:lng]
      session[:destination] = { name: name, address: address, lat: lat, lng: lng}

      if params[:selected_activity].first == "climbing"
        redirect_to '/search/climbs/new'
      end
    end
  end
end
