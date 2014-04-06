json.array!(@heights) do |height|
  json.extract! height, :id, :height
  json.url height_url(height, format: :json)
end
