class HikeOption

  attr_reader :name, :url, :lat, :lng

  def initialize(attributes)
    @name = attributes[:name]
    @url = attributes[:url]
    @lat = attributes[:latitude]
    @lng = attributes[:longitude]
  end

end
