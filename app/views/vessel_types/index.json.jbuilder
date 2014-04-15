json.array!(@vessel_types) do |vessel_type|
  json.extract! vessel_type, :id, :name
  json.url vessel_type_url(vessel_type, format: :json)
end
