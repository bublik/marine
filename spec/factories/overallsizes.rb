# == Schema Information
#
# Table name: overallsizes
#
#  id           :integer          not null, primary key
#  overall_size :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :overallsize do
    overall_size 1
  end
end
