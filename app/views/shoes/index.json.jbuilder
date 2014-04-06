json.array!(@shoes) do |shoe|
  json.extract! shoe, :id, :shoes_size
  json.url shoe_url(shoe, format: :json)
end
