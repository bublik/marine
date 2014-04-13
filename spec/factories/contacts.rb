# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    country nil
    region "MyString"
    street "MyString"
    postal_code "MyString"
    airport "MyString"
    phone "MyString"
    mphone "MyString"
    email "MyString"
    skype "MyString"
  end
end
