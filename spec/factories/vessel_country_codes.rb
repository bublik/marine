# == Schema Information
#
# Table name: vessel_country_codes
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vessel_country_code do
    code "MyString"
    name "MyString"
  end
end
