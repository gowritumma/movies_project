json.extract! movie, :id, :name, :user_id, :preview_video_url, :string, :runtime, :integer, :synopsis, :created_at, :updated_at
json.url movie_url(movie, format: :json)
