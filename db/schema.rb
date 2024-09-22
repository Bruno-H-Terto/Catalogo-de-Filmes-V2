# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_22_082454) do
  create_table "directors", force: :cascade do |t|
    t.string "name", null: false
    t.string "nationality", null: false
    t.date "birthday", null: false
    t.integer "gender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gender_id"], name: "index_directors_on_gender_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name", null: false
    t.integer "year", null: false
    t.text "synopsis", null: false
    t.integer "length", null: false
    t.integer "director_id", null: false
    t.integer "gender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_movies_on_director_id"
    t.index ["gender_id"], name: "index_movies_on_gender_id"
  end

  add_foreign_key "directors", "genders"
  add_foreign_key "movies", "directors"
  add_foreign_key "movies", "genders"
end
