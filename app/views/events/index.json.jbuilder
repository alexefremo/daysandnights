json.array!(@events) do |event|
  json.extract! event, :id, :title, :slug, :user_id, :content, :place_id, :start_date, :end_time
  json.url event_url(event, format: :json)
end
