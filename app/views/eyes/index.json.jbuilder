json.array!(@eyes) do |eye|
  json.extract! eye, :id, :name
  json.url eye_url(eye, format: :json)
end
