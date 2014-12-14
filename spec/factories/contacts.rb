# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  country_id  :integer
#  region      :string(255)
#  city        :string(255)
#  street      :string(255)
#  postal_code :string(255)
#  airport     :string(255)
#  phone       :string(255)
#  mphone      :string(255)
#  email       :string(255)
#  skype       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer          not null
#  next_of_kin :string(255)
#  name        :string(255)
#  logo        :string(255)
#

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
