class Certificate < ActiveRecord::Base
  belongs_to :cert
  belongs_to :country

  validates :country_id, :from_date, :cert_id, :licence_number, presence: true
  validates :to_date, presence: true, unless: :is_unlimited

end
