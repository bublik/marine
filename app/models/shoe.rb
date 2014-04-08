# == Schema Information
#
# Table name: shoes
#
#  id         :integer          not null, primary key
#  shoes_size :integer
#  created_at :datetime
#  updated_at :datetime
#

class Shoe < ActiveRecord::Base
  has_many :personals
  validates_presence_of :shoes_size

end
