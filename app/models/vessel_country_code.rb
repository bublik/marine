class VesselCountryCode < ActiveRecord::Base
  validates :code, :name, presence: true

end
