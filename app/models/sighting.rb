class Sighting < ActiveRecord::Base
  validates :species_id, :presence => :true
  validates :location_id, :presence => :true
end
