# == Schema Information
#
# Table name: maritals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Marital < ActiveRecord::Base
  has_many :personals
  validates_presence_of :name

end
