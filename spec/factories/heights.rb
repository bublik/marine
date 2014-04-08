# == Schema Information
#
# Table name: heights
#
#  id         :integer          not null, primary key
#  height     :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :height do
    height 1
  end
end
