# == Schema Information
#
# Table name: vacancies
#
#  id                   :integer          not null, primary key
#  rank_id              :integer
#  vessel_type_id       :integer
#  salary_min           :integer
#  salary_max           :integer
#  salary_currency      :string(255)
#  term_in_month        :integer
#  from_date            :date
#  country_id           :integer
#  language_id          :integer
#  require_description  :string(255)
#  ship                 :string(255)
#  ship_motor           :string(255)
#  nationality          :string(255)
#  region               :string(255)
#  crew_id              :integer
#  shipowner_country_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class Vacancy < ActiveRecord::Base
  belongs_to :rank
  belongs_to :vessel_type
  belongs_to :country
  belongs_to :language
  belongs_to :shipowner_country, foreign_key: :shipowner_country_id, class_name: 'Country'
  belongs_to :crewing, foreign_key: :crew_id, class_name: 'User'

  has_many :user_vacancies
  has_many :users, -> { where("cv_updated_at IS NOT NULL").order('cv_updated_at DESC') }, through: :user_vacancies

  validates_numericality_of :salary_min, :salary_max, :term_in_month
  validates_presence_of :rank_id, :vessel_type_id, :country_id, :language_id, :shipowner_country_id
  validates_length_of :require_description, maximum: 254
  scope :active, -> { where('from_date >= ?', Date.today) }

  def can_edit?(user)
    return true if user.admin?
    logger.info("Vacancy.crew_id #{self.crew_id} == user.crew_id #{user.crew_id}")
    self.crew_id && self.crew_id.eql?(user.crew_id) && (user.crewing? || user.manager?)
  end

end
