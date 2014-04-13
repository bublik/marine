json.array!(@certs) do |cert|
  json.extract! cert, :id, :name, :category
  json.url cert_url(cert, format: :json)
end
