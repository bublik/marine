json.array!(@seaservices) do |seaservice|
  json.extract! seaservice, :id, :vessel_name, :vessel_country_code_id, :vessel_year, :vessel_type_id, :vessel_dwt, :vessel_engine_id, :vessel_engine_model, :vessel_engine_power, :rank_id, :on_date, :off_date, :owner_name, :agent_name
  json.url seaservice_url(seaservice, format: :json)
end
