module Api
  module V1
    class ScoresController < ApiController
      before_action :authenticate

      def create
        @movie = Movie.find_by_id(params[:movie_id])
        if !@movie
          render json: { message: "Invalid Movie id"}, status: :not_found
        else
          @scores = @movie.scores.where(:user => current_user)
          if @scores.size == 1
          #  update score
            puts "update score"
            @scores[0].update_attributes(:score => params[:score])
            render json: { message: "Score updated"}, status: :ok
          else
            #create new score
            puts "create score"
            @score = @movie.scores.create(:score => params[:score], :user => current_user)
            render json: { message: "New score created"}, status: :ok
          end
        end
      end

      def destroy
        @movie = Movie.find_by_id(params[:movie_id])
        if !@movie
          render json: { message: "Invalid Movie id"}, status: :not_found
        else
          @scores = @movie.scores.where(:user => current_user)
          if @scores.size == 1
          #  delete the score
            @scores[0].destroy
            render json: { message: "Score deleted successfully."}, status: :ok
          else
            render json: { message: "No score available for this movie"}, status: :not_found
          end
        end
      end

    end

  end
end