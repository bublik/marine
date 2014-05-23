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

class Certificate < ActiveRecord::Base
  belongs_to :cert
  belongs_to :country
  belongs_to :user

  validates :country_id, :from_date, :cert_id, :user_id, :licence_number, presence: true
  validates :to_date, presence: true, unless: :is_unlimited

end
