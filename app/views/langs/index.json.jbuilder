json.array!(@langs) do |lang|
  json.extract! lang, :id, :language_id, :level
  json.url lang_url(lang, format: :json)
end
