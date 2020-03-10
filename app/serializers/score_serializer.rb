class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :score, :user_id, :movie_id, :created_at
end
