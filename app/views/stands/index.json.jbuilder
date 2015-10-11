json.array!(@stands) do |stand|
  json.extract! stand, :id, :latitude, :longtitude, :adress, :description
  json.url stand_url(stand, format: :json)
end
