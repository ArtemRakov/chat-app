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

ActiveRecord::Schema.define(version: 2021_04_12_020601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "team_channel_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "channel_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_team_channel_members_on_channel_id"
    t.index ["team_id"], name: "index_team_channel_members_on_team_id"
    t.index ["user_id"], name: "index_team_channel_members_on_user_id"
  end

  create_table "team_channel_messages", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_team_channel_messages_on_channel_id"
    t.index ["team_id"], name: "index_team_channel_messages_on_team_id"
    t.index ["user_id"], name: "index_team_channel_messages_on_user_id"
  end

  create_table "team_channels", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id", "slug"], name: "index_team_channels_on_team_id_and_slug", unique: true
    t.index ["team_id"], name: "index_team_channels_on_team_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "owner_id", null: false
    t.string "slug"
    t.index ["owner_id"], name: "index_teams_on_owner_id"
    t.index ["slug"], name: "index_teams_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "team_channel_members", "team_channels", column: "channel_id"
  add_foreign_key "team_channel_members", "teams"
  add_foreign_key "team_channel_members", "users"
  add_foreign_key "team_channel_messages", "team_channels", column: "channel_id"
  add_foreign_key "team_channel_messages", "teams"
  add_foreign_key "team_channel_messages", "users"
  add_foreign_key "team_channels", "teams"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
end
