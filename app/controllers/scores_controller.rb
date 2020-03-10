class ScoresController < ApplicationController
    before_action :set_movie, only: [:create, :update, :delete]
	 def create
     @score = @movie.scores.create(:score => params[:score][:score], :user => current_user)
     respond_to do |format|
         format.js   { }
     end
    end

    def update
      @score = Score.find(params[:id])
      @score.update_attributes(:score => params[:score][:score])
      respond_to do |format|
        format.js   { }
      end
    end

    def delete
        @score = Score.find(params[:id])
        @score.destroy
        redirect_to movie_path(@movie)
    end

    private
 # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

   def scores_params
        params.require(:score).permit(:user_id, :movie_id, :score)
   end
end
