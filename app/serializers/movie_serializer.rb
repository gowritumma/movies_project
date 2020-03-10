class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :preview_video_url, :synopsis, :runtime, :created_at, :updated_at, :genres, :avg_score, :most_recent_scores
  
	def genres
		self.object.genres
	end

	def avg_score
		self.object.scores.average(:score)
	end

	def most_recent_scores
		# self.object.scores.last(2).reverse
		self.object.scores.last(2).reverse.map do |s|
			{"id": s.id,
			"score":  s.score,
			"user_id":  s.movie_id,
			"created_at": s.created_at}
		end
	end

end
