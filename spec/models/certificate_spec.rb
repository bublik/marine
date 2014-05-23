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

require 'spec_helper'

describe Certificate do
  pending "add some examples to (or delete) #{__FILE__}"
end
