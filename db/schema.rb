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

ActiveRecord::Schema[7.0].define(version: 2023_04_27_184130) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer "status"
    t.bigint "user_id", null: false
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.integer "recommend"
    t.string "headline"
    t.text "content"
    t.bigint "viewing_id", null: false
    t.bigint "user_id", null: false
    t.integer "show_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["viewing_id"], name: "index_reviews_on_viewing_id"
  end

  create_table "shows", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "origin_country"
    t.string "original_language"
    t.string "original_name"
    t.string "overview"
    t.string "poster_path"
    t.string "first_air_date"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "viewings", force: :cascade do |t|
    t.integer "status", default: 0
    t.text "note"
    t.string "movie_id"
    t.string "tv_id"
    t.string "name"
    t.integer "progress", default: 0
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_viewings_on_user_id"
  end

  add_foreign_key "friendships", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "viewings"
  add_foreign_key "viewings", "users"
end
