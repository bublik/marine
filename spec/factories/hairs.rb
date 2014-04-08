# == Schema Information
#
# Table name: hairs
#
#  id         :integer          not null, primary key
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hair do
    color "MyString"
  end
end
