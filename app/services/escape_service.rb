class EscapeService

  def get_destination_info(destination)
    response = location_response(destination)
    if response.status == 404
      return response.status
    else
      JSON.parse(response.body, symbolize_names: true)[:candidates].first
    end
  end

  def get_climb_results(params, location)
    response = climbs_response(params, location)
    if response.status == 404
      return response.status
    else
      JSON.parse(response.body, symbolize_names: true)
    end
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
    end
  end
end
