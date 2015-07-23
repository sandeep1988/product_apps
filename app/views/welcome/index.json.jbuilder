json.array!(@users) do |user|
  json.extract! user, :id, :email
  json.url root_url(user, format: :json)
end
