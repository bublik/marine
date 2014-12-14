# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  payment_type   :string(255)
#  uid            :integer
#  send_status    :integer          default(0)
#  payment_status :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
