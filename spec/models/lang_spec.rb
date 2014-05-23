# == Schema Information
#
# Table name: langs
#
#  id          :integer          not null, primary key
#  language_id :integer
#  level       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer          not null
#

require 'spec_helper'

describe Lang do
  pending "add some examples to (or delete) #{__FILE__}"
end
