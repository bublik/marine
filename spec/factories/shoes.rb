# == Schema Information
#
# Table name: shoes
#
#  id         :integer          not null, primary key
#  shoes_size :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shoe do
    shoes_size 1
  end
end
