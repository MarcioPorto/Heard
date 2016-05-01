json.array!(@blocked_phone_numbers) do |blocked_phone_number|
  json.extract! blocked_phone_number, :id, :phone_number
  json.url blocked_phone_number_url(blocked_phone_number, format: :json)
end
