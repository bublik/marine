# == Schema Information
#
# Table name: seaservices
#
#  id                     :integer          not null, primary key
#  vessel_name            :string(255)
#  vessel_country_code_id :integer
#  vessel_year            :string(255)
#  vessel_type_id         :integer
#  vessel_dwt             :string(255)
#  vessel_engine_model    :string(255)
#  vessel_engine_power    :integer
#  rank_id                :integer
#  on_date                :date
#  off_date               :date
#  owner_name             :string(255)
#  agent_name             :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  user_id                :integer          not null
#  vessel_engine          :string(255)
#

class Seaservice < ActiveRecord::Base
  belongs_to :vessel_country_code
  belongs_to :vessel_type
  belongs_to :rank
  belongs_to :user

  validates :user_id, :vessel_country_code, :vessel_type, :rank,
            :vessel_name, :on_date, :off_date, :vessel_dwt, :vessel_year, presence: true

  scope :last_years, ->(number) { where('seaservices.on_date > ?', Time.now - number.years) }

end
