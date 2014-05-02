class Lang < ActiveRecord::Base
  belongs_to :language
  belongs_to :user

  LEVELS = ['native', 'excellent', 'good', 'average', 'poor']

  validates_presence_of :language_id, :user_id, :level
  validates_inclusion_of :level, in: Lang::LEVELS

end
