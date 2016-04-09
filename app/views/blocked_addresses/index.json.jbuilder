json.array!(@blocked_addresses) do |blocked_address|
  json.extract! blocked_address, :id, :ip_address
  json.url blocked_address_url(blocked_address, format: :json)
end
