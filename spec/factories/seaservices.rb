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
