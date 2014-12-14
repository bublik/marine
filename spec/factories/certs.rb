# == Schema Information
#
# Table name: certs
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  category       :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  show_on_wizard :boolean          default(FALSE)
#  position       :integer          default(0)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cert do
    name "MyString"
    category "MyString"
  end
end
