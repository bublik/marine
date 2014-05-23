# == Schema Information
#
# Table name: seaservices
#
#  id                     :integer          not null, primary key
#  vessel_name            :string(255)
#  vessel_country_code_id :integer
#  vessel_year            :string(255)
#  vessel_type_id         :integer
#  vessel_dwt             :string(255)
#  vessel_engine_model    :string(255)
#  vessel_engine_power    :integer
#  rank_id                :integer
#  on_date                :date
#  off_date               :date
#  owner_name             :string(255)
#  agent_name             :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  user_id                :integer          not null
#  vessel_engine          :string(255)
#

require 'spec_helper'

describe Seaservice do
  pending "add some examples to (or delete) #{__FILE__}"
end
