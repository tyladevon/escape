class Hike < ApplicationRecord
  belongs_to :trip
  validates_presence_of :name, :url, :lat, :lng
end
