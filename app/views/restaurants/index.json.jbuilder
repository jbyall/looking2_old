json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :location, :style
  json.url restaurant_url(restaurant, format: :json)
end
