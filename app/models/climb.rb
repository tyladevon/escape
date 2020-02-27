class Climb < ApplicationRecord
  validates_presence_of :name,
                        :climb_type,
                        :rating,
                        :stars,
                        :lat,
                        :lng,
                        :url

  validates_numericality_of :stars,
                            :lat,
                            :lng

  has_many :trip_climbs
  has_many :trips, through: :trip_climbs
end
