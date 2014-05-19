class Seaservice < ActiveRecord::Base
  belongs_to :vessel_country_code
  belongs_to :vessel_type
  belongs_to :rank
  belongs_to :user

  validates :user_id, :vessel_country_code, :vessel_type, :rank,
            :vessel_name, :on_date, :off_date, :vessel_dwt, :vessel_year, presence: true

  scope :last_years, ->(number) { where('seaservices.on_date > ?', Time.now - number.years) }

end
