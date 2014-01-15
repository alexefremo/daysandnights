json.array!(@advertises) do |advertise|
  json.extract! advertise, :id, :title, :url, :starts
  json.url advertise_url(advertise, format: :json)
end
