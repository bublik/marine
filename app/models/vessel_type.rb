class VesselType < ActiveRecord::Base
  validates :name, presence: true

end
