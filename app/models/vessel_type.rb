# == Schema Information
#
# Table name: vessel_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VesselType < ActiveRecord::Base
  validates :name, presence: true

end
