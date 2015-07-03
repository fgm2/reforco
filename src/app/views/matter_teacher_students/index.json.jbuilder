json.array!(@matter_teacher_students) do |matter_teacher_student|
  json.extract! matter_teacher_student, :id, :matter_id, :teacher_id, :student_id, :many
  json.url matter_teacher_student_url(matter_teacher_student, format: :json)
end
