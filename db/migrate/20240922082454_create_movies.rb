class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.integer :year, null: false
      t.text :synopsis, null: false
      t.integer :length, null: false
      t.references :director, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
