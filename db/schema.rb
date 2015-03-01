# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150302064215) do

  create_table "albums", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "description",  limit: 255
    t.integer  "viewed",       limit: 4,   default: 0
    t.integer  "photos_count", limit: 4,   default: 0
    t.integer  "cover_id",     limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "diaries", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "title",        limit: 255
    t.text     "content",      limit: 65535
    t.string   "featured_img", limit: 255
    t.integer  "viewed",       limit: 4,     default: 1, null: false
    t.string   "location",     limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "diaries", ["user_id"], name: "index_diaries_on_user_id", using: :btree

  create_table "guestbooks", force: :cascade do |t|
    t.integer  "visitor_id", limit: 4
    t.integer  "host_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "guestbooks", ["host_id"], name: "index_guestbooks_on_host_id", using: :btree
  add_index "guestbooks", ["visitor_id"], name: "index_guestbooks_on_visitor_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "file",        limit: 255
    t.integer  "album_id",    limit: 4
    t.integer  "viewed",      limit: 4,     default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "statuses", ["user_id"], name: "index_statuses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "real_name",              limit: 255
    t.string   "nick_name",              limit: 255
    t.string   "mobile_phone",           limit: 255
    t.string   "location",               limit: 255
    t.integer  "level",                  limit: 4,   default: 1,    null: false
    t.integer  "viewed",                 limit: 4,   default: 1,    null: false
    t.boolean  "is_new_user",            limit: 1,   default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "authorizations", "users"
  add_foreign_key "diaries", "users"
  add_foreign_key "photos", "albums"
  add_foreign_key "statuses", "users"
end
