class DefaultRuntimeToMovieTable < ActiveRecord::Migration[5.1]
  def change
  	change_column_default(
  :movies,
  :runtime,
  from: nil,
  to: 0
)
  end
end
