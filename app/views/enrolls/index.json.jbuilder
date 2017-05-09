json.array!(@enrolls) do |enroll|
  json.extract! enroll, :id, :user_id, :course_id, :semester_id
  json.url enroll_url(enroll, format: :json)
end
