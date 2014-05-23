# == Schema Information
#
# Table name: certificates
#
#  id             :integer          not null, primary key
#  cert_id        :integer
#  country_id     :integer
#  is_flag        :boolean
#  issuer         :string(255)
#  from_date      :date
#  to_date        :date
#  is_unlimited   :boolean
#  licence_number :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer          not null
#

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
