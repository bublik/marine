json.array!(@agency_subscriptions) do |agency_subscription|
  json.extract! agency_subscription, :id, :email, :name, :is_active
  json.url agency_subscription_url(agency_subscription, format: :json)
end
