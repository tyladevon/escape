class TripClimb < ApplicationRecord
  belongs_to :trip
  belongs_to :climb

  validates_presence_of :trip_id, :climb_id
end
