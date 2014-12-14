# == Schema Information
#
# Table name: agency_subscriptions
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  is_active  :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe AgencySubscription do
  pending "add some examples to (or delete) #{__FILE__}"
end
