class EscapeService

  def get_destination_info(destination)
    response = location_response(destination)
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
end
