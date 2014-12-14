# == Schema Information
#
# Table name: vacancies
#
#  id                   :integer          not null, primary key
#  rank_id              :integer
#  vessel_type_id       :integer
#  salary_min           :integer
#  salary_max           :integer
#  salary_currency      :string(255)
#  term_in_month        :integer
#  from_date            :date
#  country_id           :integer
#  language_id          :integer
#  require_description  :string(255)
#  ship                 :string(255)
#  ship_motor           :string(255)
#  nationality          :string(255)
#  region               :string(255)
#  crew_id              :integer
#  shipowner_country_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

require 'spec_helper'

describe Vacancy do
  pending "add some examples to (or delete) #{__FILE__}"
end
