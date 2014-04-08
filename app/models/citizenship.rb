# == Schema Information
#
# Table name: citizenships
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Citizenship < ActiveRecord::Base
  validates_presence_of :name
  has_many :personals

end
