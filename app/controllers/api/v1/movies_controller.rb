module Api
  module V1

    class MoviesController < ApiController
      include ActionController::Serialization
      before_action :authenticate, only: [:create, :update, :destroy]
      before_action :is_admin, only: [:create, :update, :destroy]
      serialization_scope nil
     

      def index
        @movies = Movie.all
        render json: @movies, include: :genres, status: 200
      end

      def show
        # @movie = Moive.joins(:country).select('datacenters.*, countries.name as country').where('datacenters.id = ?', params[:id])
        # Movie.joins(:scores).group('scores.movie_id').select('movies.*, average(scores.score)').where('movies.id=?', 4)
        # Movie.select('movies.*, AVG(scores.score) AS average_score').group('scores.movie_id').joins(:scores)
        puts "in show method"
        @movie = Movie.find_by_id(params[:id])
        if !@movie
          render json: { message: "Movie Record Not found"}, status: :not_found
        else
          # @genres = @movie.genres
          # avg_score = @movie.scores.average(:score)
          render json: @movie
        end

      end
      def create
        @movie = Movie.new(movie_params)
        @movie.user = @current_user
        @movie.save
        @genre_ids = params[:genre_ids]
        @genre_ids.each do |i|
          @movie.genres << Genre.find(i)
        end
        if !@movie
          render json: { message: "Unable to create Movie"}, status: :not_found
        else
          render json: @movie, status: 200
        end
      end

      def update
        @movie = Movie.find_by_id(params[:movie][:id])
        if !@movie
        render json: { message: "Invalid Movie id"}, status: :not_found
        else
        if @movie.update(movie_params)
          render json: @movie, status: 200
        else
          render json: { message: "Unable to create Movie"}, status: :not_found
        end
        end
      end

      def destroy
        @movie = Movie.find_by_id(params[:id])
        if !@movie
          render json: { message: "Invalid Movie id"}, status: :not_found
        else
          @movie.destroy
          render json: { message: "Movie deleted"}, status: :ok
        end
      end

      private


      def movie_params
        params.require(:movie).permit(:name, :preview_video_url, :runtime, :synopsis)
      end

    end
  end
end