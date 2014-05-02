class Seaservice < ActiveRecord::Base
  belongs_to :vessel_country_code
  belongs_to :vessel_type
  belongs_to :vessel_engine
  belongs_to :rank
  belongs_to :user


  validates :user_id, :vessel_country_code, :vessel_type, :vessel_engine, :rank,
            :vessel_name, :on_date, :off_date, :vessel_dwt, :vessel_year, presence: true

end
