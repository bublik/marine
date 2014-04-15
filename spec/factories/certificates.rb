# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :certificate do
    cert nil
    country nil
    is_flag false
    issuer ""
    from_date "2014-04-13"
    to_date "2014-04-13"
    is_unlimited false
    licence_number "MyString"
  end
end
