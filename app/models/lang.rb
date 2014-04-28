class Lang < ActiveRecord::Base
  belongs_to :language
  LEVELS = ['native', 'excellent', 'good', 'average', 'poor']

  validates_presence_of :language_id, :level
  validates_inclusion_of :level, in: Lang::LEVELS

end
