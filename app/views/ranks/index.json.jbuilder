json.array!(@ranks) do |rank|
  json.extract! rank, :id, :name
  json.url rank_url(rank, format: :json)
end
