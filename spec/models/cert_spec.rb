# == Schema Information
#
# Table name: certs
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  category       :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  show_on_wizard :boolean          default(FALSE)
#

require 'spec_helper'

describe Cert do
  pending "add some examples to (or delete) #{__FILE__}"
end
