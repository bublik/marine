json.array!(@maritals) do |marital|
  json.extract! marital, :id, :name
  json.url marital_url(marital, format: :json)
end
