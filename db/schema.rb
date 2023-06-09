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

ActiveRecord::Schema[7.0].define(version: 2023_06_06_142501) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "recommend_id", null: false
    t.bigint "user_id", null: false
    t.integer "friend_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recommend_id"], name: "index_chats_on_recommend_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "status"
    t.bigint "user_id", null: false
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "recommends", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "friend_id"
    t.bigint "show_id", null: false
    t.integer "tmdb_id"
    t.bigint "friendship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friendship_id"], name: "index_recommends_on_friendship_id"
    t.index ["show_id"], name: "index_recommends_on_show_id"
    t.index ["user_id"], name: "index_recommends_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.integer "recommend"
    t.string "headline"
    t.text "content"
    t.bigint "viewing_id", null: false
    t.bigint "user_id", null: false
    t.integer "tmdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["viewing_id"], name: "index_reviews_on_viewing_id"
  end

  create_table "season_viewings", force: :cascade do |t|
    t.integer "tmdb_id"
    t.integer "content_id"
    t.integer "season_number"
    t.bigint "show_id", null: false
    t.bigint "user_id", null: false
    t.bigint "viewing_id", null: false
    t.integer "status", default: 0
    t.text "note"
    t.integer "progress", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_season_viewings_on_show_id"
    t.index ["user_id"], name: "index_season_viewings_on_user_id"
    t.index ["viewing_id"], name: "index_season_viewings_on_viewing_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.integer "content_id"
    t.integer "tmdb_id"
    t.integer "season_number"
    t.integer "episode_count"
    t.string "air_date"
    t.string "overview"
    t.string "poster_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "show_id"
    t.index ["show_id"], name: "index_seasons_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "original_name"
    t.string "original_language"
    t.string "name"
    t.string "overview"
    t.string "poster_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "words_to_live_by"
    t.integer "age"
    t.string "location"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "viewings", force: :cascade do |t|
    t.integer "status", default: 0
    t.text "note"
    t.integer "tmdb_id"
    t.string "name"
    t.integer "progress", default: 0
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_viewings_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chats", "recommends"
  add_foreign_key "chats", "users"
  add_foreign_key "friendships", "users"
  add_foreign_key "recommends", "friendships"
  add_foreign_key "recommends", "shows"
  add_foreign_key "recommends", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "viewings"
  add_foreign_key "season_viewings", "shows"
  add_foreign_key "season_viewings", "users"
  add_foreign_key "season_viewings", "viewings"
  add_foreign_key "seasons", "shows"
  add_foreign_key "viewings", "users"
end
