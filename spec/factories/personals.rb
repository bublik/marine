# == Schema Information
#
# Table name: personals
#
#  id                :integer          not null, primary key
#  available_from    :datetime
#  salary            :integer
#  rank_id           :integer
#  surname           :string(255)
#  name              :string(255)
#  middle_name       :string(255)
#  pp_dob            :date
#  pp_pob            :string(255)
#  country_id        :integer
#  citizenship_id    :integer
#  marital_id        :integer
#  sex               :string(255)
#  eye_id            :integer
#  hair_id           :integer
#  height_id         :integer
#  weight_id         :integer
#  overallsize_id    :integer
#  shoe_id           :integer
#  taxation_id_code  :string(255)
#  note              :text
#  created_at        :datetime
#  updated_at        :datetime
#  photo             :string(255)
#  user_id           :integer          not null
#  required_position :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :personal do
    available_from "2014-04-08 21:47:44"
    rank nil
    surname "MyString"
    name "MyString"
    middle_name "MyString"
    pp_dob "2014-04-08"
    pp_pob "MyString"
    country nil
    citizenship nil
    marital nil
    sex "MyString"
    eye nil
    hair nil
    height nil
    weight nil
    overallsize nil
    shoe nil
    taxation_id_code "MyString"
    note "MyText"
  end
end
