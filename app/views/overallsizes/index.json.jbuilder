json.array!(@overallsizes) do |overallsize|
  json.extract! overallsize, :id, :overall_size
  json.url overallsize_url(overallsize, format: :json)
end
