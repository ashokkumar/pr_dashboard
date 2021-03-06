# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170823044406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pull_requests", force: :cascade do |t|
    t.string "number", null: false
    t.string "html_url", null: false
    t.string "state", null: false
    t.text "title"
    t.datetime "pr_created_at"
    t.datetime "pr_closed_at"
    t.datetime "pr_merged_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "pull_request_id"
    t.string "state", null: false
    t.string "user"
    t.datetime "submitted_at"
    t.text "body"
    t.index ["pull_request_id"], name: "index_reviews_on_pull_request_id"
  end

  add_foreign_key "reviews", "pull_requests"
end
