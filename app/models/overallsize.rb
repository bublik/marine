# == Schema Information
#
# Table name: overallsizes
#
#  id           :integer          not null, primary key
#  overall_size :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Overallsize < ActiveRecord::Base
  has_many :personals

  validates_presence_of :overall_size
  validates_numericality_of :overall_size

end
