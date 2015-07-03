json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :formation, :created_at, :user_id
  json.url teacher_url(teacher, format: :json)
end
