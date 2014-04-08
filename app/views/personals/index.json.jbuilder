json.array!(@personals) do |personal|
  json.extract! personal, :id, :available_from, :rank_id, :surname, :name, :middle_name, :pp_dob, :pp_pob, :country_id, :citizenship_id, :marital_id, :sex, :eye_id, :hair_id, :height_id, :weight_id, :overallsize_id, :shoe_id, :taxation_id_code, :note
  json.url personal_url(personal, format: :json)
end
