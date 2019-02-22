class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :category
      t.string :price
      t.string :year
      t.string :attachment

      t.timestamps
    end
  end
end
