json.array!(@citizenships) do |citizenship|
  json.extract! citizenship, :id, :name
  json.url citizenship_url(citizenship, format: :json)
end
