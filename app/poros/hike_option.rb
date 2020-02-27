class HikeOption

  attr_reader :name,
              :url,
              :lat,
              :lng,
              :summary,
              :difficulty,
              :stars,
              :location,
              :length,
              :ascent,
              :max_elevation,
              :rid

  def initialize(attributes)
    @name = attributes[:name]
    @rid = attributes[:rid]
    @url = attributes[:url]
    @lat = attributes[:latitude]
    @lng = attributes[:longitude]
    @summary = attributes[:summary]
    @difficulty = attributes[:difficulty]
    @stars = attributes[:stars]
    @location = attributes[:location]
    @length = attributes[:length]
    @ascent = attributes[:ascent]
    @max_elevation = attributes[:high]
  end
end
