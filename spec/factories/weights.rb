# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  weight     :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weight do
    weight 1
  end
end
