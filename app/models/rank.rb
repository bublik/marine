# == Schema Information
#
# Table name: ranks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Rank < ActiveRecord::Base
  has_many :personals
  validates_presence_of :name
  default_scope -> { order(:name) }

end
