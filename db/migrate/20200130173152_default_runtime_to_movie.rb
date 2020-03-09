class DefaultRuntimeToMovie < ActiveRecord::Migration[5.1]
   def change
    change_column_null :movies, :runtime, 0
  end
end
