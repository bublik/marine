class Certificate < ActiveRecord::Base
  belongs_to :cert
  belongs_to :country
  belongs_to :user

  validates :country_id, :from_date, :cert_id, :user_id, :licence_number, presence: true
  validates :to_date, presence: true, unless: :is_unlimited

end
