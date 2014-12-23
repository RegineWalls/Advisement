json.array!(@electives) do |elective|
  json.extract! elective, :id
  json.url elective_url(elective, format: :json)
end
