json.array!(@salaries) do |salary|
  json.extract! salary, :id, :amount
  json.url salary_url(salary, format: :json)
end
