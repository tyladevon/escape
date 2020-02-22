class SearchController < ApplicationController
  def new
    @activities = ["climbing", "hiking"]
  end

  def create
    destination = params[:destination].delete(' ')

    destination_info = EscapeService.new.get_destination_info(destination)
    if destination_info == 404
      flash[:notice] = "The destination you entered cannot be found. Please try again."
      @activities = ["climbing", "hiking"]
      render :new
    else

      address = destination_info[:formatted_address]
      photo = destination_info[:photos].first[:photo_reference]
      session[:destination] = { name: params[:destination], address: address, photo_reference: photo}

      if params[:selected_activity].first == "climbing"
        redirect_to '/search/climbs/new'
      end
    end
  end
end
