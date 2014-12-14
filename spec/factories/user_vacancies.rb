# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_vacancy do
    user nil
    vacancy nil
    status "MyString"
  end
end
