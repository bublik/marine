# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  payment_type   :string(255)
#  uid            :integer
#  send_status    :integer          default(0)
#  payment_status :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user_id nil
    payment_type "MyString"
    send_status "MyString"
  end
end
