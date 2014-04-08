# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  weight     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Weight < ActiveRecord::Base
  has_many :personals
  validates_presence_of :created_at

end
