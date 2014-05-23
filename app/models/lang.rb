# == Schema Information
#
# Table name: langs
#
#  id          :integer          not null, primary key
#  language_id :integer
#  level       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer          not null
#

class Lang < ActiveRecord::Base
  belongs_to :language
  belongs_to :user

  LEVELS = ['native', 'excellent', 'good', 'average', 'poor']

  validates_presence_of :language_id, :user_id, :level
  validates_inclusion_of :level, in: Lang::LEVELS

end
