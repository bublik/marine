json.array!(@hairs) do |hair|
  json.extract! hair, :id, :color
  json.url hair_url(hair, format: :json)
end
