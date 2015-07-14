json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :course_id, :student_id, :hours, :evaluation
  json.url enrollment_url(enrollment, format: :json)
end
