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

ActiveRecord::Schema.define(version: 20160718180622) do

  create_table "ad_bars", force: :cascade do |t|
    t.string   "position",             limit: 255
    t.integer  "css_width",            limit: 4,   default: 0
    t.integer  "css_height",           limit: 4,   default: 0
    t.integer  "images_limit",         limit: 4,   default: 0
    t.string   "css_background_color", limit: 255
    t.integer  "space_between_images", limit: 4,   default: 0
    t.integer  "campaign_id",          limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "ad_bars", ["campaign_id"], name: "index_ad_bars_on_campaign_id", using: :btree

  create_table "ads", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.text     "title",              limit: 65535
    t.text     "subtitle",           limit: 65535
    t.text     "url",                limit: 65535
    t.integer  "sort_order",         limit: 4
    t.string   "dimensions",         limit: 255
    t.integer  "ad_bar_id",          limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "ads", ["ad_bar_id"], name: "index_ads_on_ad_bar_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "campaigns", ["company_id"], name: "index_campaigns_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "trading_name",        limit: 255
    t.string   "registration_number", limit: 255
    t.text     "address",             limit: 65535
    t.text     "domain_url",          limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "login_bg_images", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "dimensions",         limit: 255
    t.integer  "sort_order",         limit: 4
    t.integer  "campaign_id",        limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "login_bg_images", ["campaign_id"], name: "index_login_bg_images_on_campaign_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       limit: 4
    t.integer  "invited_by_id",          limit: 4
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",      limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "ad_bars", "campaigns"
  add_foreign_key "ads", "ad_bars"
  add_foreign_key "campaigns", "companies"
  add_foreign_key "login_bg_images", "campaigns"
end
