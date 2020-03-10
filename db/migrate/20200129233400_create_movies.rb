class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :preview_video_url
      t.integer :runtime
      t.string :synopsis
      t.timestamps
    end
  end
end
