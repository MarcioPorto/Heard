json.array!(@answers) do |answer|
  json.extract! answer, :id, :content, :ip_address, :created_at, :updated_at
  json.url answer_url(answer, format: :json)
end
