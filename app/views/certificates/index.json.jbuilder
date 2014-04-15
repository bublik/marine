json.array!(@certificates) do |certificate|
  json.extract! certificate, :id, :cert_id, :country_id, :is_flag, :issuer, :from_date, :to_date, :is_unlimited, :licence_number
  json.url certificate_url(certificate, format: :json)
end
