json.extract! meeting, :id, :location, :time, :description, :purpose, :max_attendees, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
