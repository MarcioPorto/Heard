json.array!(@answers) do |answer|
  json.extract! answer, :id, :content, :ip_address
  json.url answer_url(answer, format: :json)
end
