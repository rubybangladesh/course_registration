json.array!(@registers) do |register|
  json.extract! register, :id, :enroll, :course_id
  json.url register_url(register, format: :json)
end
