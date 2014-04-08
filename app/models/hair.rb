# == Schema Information
#
# Table name: hairs
#
#  id         :integer          not null, primary key
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Hair < ActiveRecord::Base
  validates_presence_of :color
  has_many :personals

end
