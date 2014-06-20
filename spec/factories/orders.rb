# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user_id nil
    payment_type "MyString"
    send_status "MyString"
  end
end
