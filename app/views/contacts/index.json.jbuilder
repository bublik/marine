json.array!(@contacts) do |contact|
  json.extract! contact, :id, :country_id, :region, :street, :postal_code, :airport, :phone, :mphone, :email, :skype
  json.url contact_url(contact, format: :json)
end
