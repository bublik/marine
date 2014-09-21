# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyString"
    in_menu false
    url "MyString"
    description "MyString"
    keywords "MyString"
    content "MyText"
  end
end
