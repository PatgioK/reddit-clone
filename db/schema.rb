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

ActiveRecord::Schema.define(version: 2022_04_05_173418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.text "bio"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.bigint "account_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_comments_on_account_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "communities", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name"
    t.string "url"
    t.text "rules"
    t.integer "total_members"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "summary"
    t.index ["account_id"], name: "index_communities_on_account_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "community_id"
    t.string "title"
    t.text "body"
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.integer "total_comments", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_posts_on_account_id"
    t.index ["community_id"], name: "index_posts_on_community_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "community_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_subscriptions_on_account_id"
    t.index ["community_id"], name: "index_subscriptions_on_community_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "post_id"
    t.boolean "upvote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_votes_on_account_id"
    t.index ["post_id"], name: "index_votes_on_post_id"
  end

end
