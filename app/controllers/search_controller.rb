class SearchController < ApplicationController
  def new
    @activities = ["climbing", "hiking"]
  end

  def create

    destination = params[:destination].delete(' ')
    response = Faraday.get("https://escape-app-api.herokuapp.com/api/v1/destination/#{destination}")

    parsed_json = JSON.parse(response.body, symbolize_names: true)[:candidates].first
    address = parsed_json[:formatted_address]
    photo = parsed_json[:photos].first[:photo_reference]
    session[:destination] = { name: params[:destination], address: address, photo_reference: photo}

    if params[:selected_activity].first == "climbing"

      redirect_to '/search/climb'
    end
  end
end
