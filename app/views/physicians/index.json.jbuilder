json.array!(@physicians) do |physician|
  json.extract! physician, :id, :type, :nameSearch, :locationSearch, :categoryDisplay, :categorySearchDisplay, :treatmentsDisplay, :physiciansDisplay, :summary
  json.url physician_url(physician, format: :json)
end
