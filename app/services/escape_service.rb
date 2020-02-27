class EscapeService

  def get_destination_info(destination)
    response = location_response(destination)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_climb_results(params, location)
    response = climbs_response(params, location)
    if response.status == 404
      return response.status
    else
      JSON.parse(response.body, symbolize_names: true)[:routes]
    end
  end

  def get_hike_results(params, lat, lng)
    response = hikes_response(params, lat, lng)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(:url => "https://escape-app-api.herokuapp.com/api/v1") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def location_response(destination)
    connection.get do |req|
      req.url ("destination/#{destination}")
    end
  end

  def climbs_response(climb_preferences, location)
    connection.get do |req|
      req.url("climb_results")
      req.params["lat"] = location["lat"]
      req.params["lon"] = location["lng"]
      req.params["min_diff"] = climb_preferences["min_diff"]
      req.params["max_diff"] = climb_preferences["max_diff"]
      req.params["max_dist"] = climb_preferences["distance"]
    end
  end

  def hikes_response(params, lat, lng)
    connection.get do |req|
      req.url ("hike_results")
      req.params["lat"] = lat
      req.params["lon"] = lng
      req.params["max_dist"] = params["max_dist"]
      req.params["max_results"] = params["max_results"]
      req.params["min_stars"] = params["min_stars"]
    end
  end
end
