class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_climbs
  has_many :climbs, through: :trip_climbs
  has_many :hikes

  validates_presence_of :name,
                        :destination_name,
                        :destination_address,
                        :lat,
                        :lng

  validates_numericality_of :lat, :lng
end
