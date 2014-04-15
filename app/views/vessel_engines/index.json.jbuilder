json.array!(@vessel_engines) do |vessel_engine|
  json.extract! vessel_engine, :id, :name
  json.url vessel_engine_url(vessel_engine, format: :json)
end
