# == Schema Information
#
# Table name: vessel_country_codes
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VesselCountryCode < ActiveRecord::Base
  validates :code, :name, presence: true

end
