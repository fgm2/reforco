json.array!(@matter_teachers) do |matter_teacher|
  json.extract! matter_teacher, :id, :matter_id, :teacher_id, :value
  json.url matter_teacher_url(matter_teacher, format: :json)
end
