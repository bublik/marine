# == Schema Information
#
# Table name: langs
#
#  id          :integer          not null, primary key
#  language_id :integer
#  level       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer          not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lang do
    language nil
    level "MyString"
  end
end
