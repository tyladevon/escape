class Destination
  attr_reader :name, :address, :lat, :lng

  def initialize(destination_info)
    @name = destination_info["name"]
    @address = destination_info["address"]
    @lat = destination_info["lat"]
    @lng = destination_info["lng"]
  end
end
