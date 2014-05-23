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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seaservice do
    vessel_name "MyString"
    vessel_country_code nil
    vessel_year "MyString"
    vessel_type nil
    vessel_dwt "MyString"
    vessel_engine nil
    vessel_engine_model "MyString"
    vessel_engine_power 1
    rank nil
    on_date "2014-04-16"
    off_date "2014-04-16"
    owner_name "MyString"
    agent_name "MyString"
  end
end
