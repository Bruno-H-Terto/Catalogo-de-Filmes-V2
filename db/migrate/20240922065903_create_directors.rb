class CreateDirectors < ActiveRecord::Migration[7.2]
  def change
    create_table :directors do |t|
      t.string :name, null: false
      t.string :nationality, null: false
      t.date :birthday, null: false
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
