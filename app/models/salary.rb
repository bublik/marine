# == Schema Information
#
# Table name: salaries
#
#  id         :integer          not null, primary key
#  amount     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Salary < ActiveRecord::Base
  has_many :personals
  validates_presence_of :amount

end
