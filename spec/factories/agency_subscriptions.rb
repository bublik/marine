# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agency_subscription do
    email "MyString"
    name "MyString"
    is_active false
  end
end
