class ClimbOptions
  attr_reader :name, :climb_type, :rating, :stars, :pitches, :location, :url, :longitude, :latitude 
  def initialize(info)
    @name = info[:name]
    @climb_type = info[:type]
    @rating = info[:rating]
    @stars = info[:stars]
    @pitches = info[:pitches]
    @location = info[:location].slice(-2..-1).join(', ') if info[:location].length > 1
    @location = info[:location].first if info[:location].length == 1
    @url = info[:url]
    @longitude = info[:longitude]
    @latitude = info[:latitude]
  end
end