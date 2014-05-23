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

require 'spec_helper'

describe Personal do
  pending "add some examples to (or delete) #{__FILE__}"
end
