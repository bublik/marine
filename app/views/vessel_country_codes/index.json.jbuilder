json.array!(@vessel_country_codes) do |vessel_country_code|
  json.extract! vessel_country_code, :id, :code, :name
  json.url vessel_country_code_url(vessel_country_code, format: :json)
end
