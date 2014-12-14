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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vacancy do
    rank nil
    vessel_type nil
    salary_min 1
    salary_max 1
    salary_currency "MyString"
    term_in_month 1
    from_date "2014-12-13"
    country nil
    lang nil
    require_description "MyString"
    ship "MyString"
    ship_motor "MyString"
    nationality "MyString"
    region "MyString"
    crew_id 1
    shipowner_country_id 1
  end
end
