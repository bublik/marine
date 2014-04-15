class VesselEngine < ActiveRecord::Base
  validates :name, presence: true

end
