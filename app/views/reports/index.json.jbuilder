json.array!(@reports) do |report|
  json.extract! report, :id, :address, :latitude, :longitude, :called_911, :description
  json.url report_url(report, format: :json)
end
