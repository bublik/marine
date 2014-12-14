# == Schema Information
#
# Table name: agency_subscriptions
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  is_active  :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agency_subscription do
    email "MyString"
    name "MyString"
    is_active false
  end
end
