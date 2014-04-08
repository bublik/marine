# == Schema Information
#
# Table name: heights
#
#  id         :integer          not null, primary key
#  height     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Height < ActiveRecord::Base
  validates_presence_of :height
  has_many :personals

end
