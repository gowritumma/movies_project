class GenresMoviesAssociation < ActiveRecord::Migration[5.1]
  def change

    create_table :genres_movies, id: false do |t|
      t.belongs_to :movie
      t.belongs_to :genre
    end
  end
end
