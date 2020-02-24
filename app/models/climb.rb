class Climb < ApplicationRecord
  validates_presence_of :route_id,
                        :name,
                        :climb_type,
                        :rating,
                        :stars,
                        :pitches,
                        :lat,
                        :lng,
                        :url

  validates_numericality_of :stars,
                            :pitches,
                            :lat,
                            :lng

  has_many :trip_climbs
  has_many :trips, through: :trip_climbs
end
