class SearchController < ApplicationController
  def new
  end

  def create
    destination = params[:destination].delete(' ')

    if destination.length == 0
      flash[:notice] = "The destination you entered cannot be found. Please try again."
      return redirect_to '/search'
    end
      destination_info = EscapeService.new.get_destination_info(destination)

    if destination_info[:data][:id].nil?
      flash[:notice] = "The destination you entered cannot be found. Please try again."
      redirect_to '/search'
    elsif params[:activity].nil?
      flash[:notice] = "Please select one activity."
      redirect_to '/search'
    else
      save_destination_to_session(destination_info)
      redirect_to_activity_search
    end
  end

  private

  def save_destination_to_session(destination_info)
    name = destination_info[:data][:attributes][:name]
    address = destination_info[:data][:attributes][:full_address]
    lat = destination_info[:data][:attributes][:longitude]
    lng = destination_info[:data][:attributes][:latitude]
    session[:destination] = { name: name, address: address, lat: lat, lng: lng}
  end

  def redirect_to_activity_search
    if params[:activity] == "climbing"
      redirect_to '/search/climbs/new'
    end
  end

  # def destination_error
  #   flash.now[:notice] = "The destination you entered cannot be found. Please try again."
  #   render :new
  # end

  # def activity_selector_error
  #   flash.now[:notice] = "Please select one activity."
  #   render :new
  # end
end
