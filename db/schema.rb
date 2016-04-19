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

ActiveRecord::Schema.define(version: 20160419014131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_ad_bars", force: :cascade do |t|
    t.integer  "position"
    t.integer  "admin_campaign_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "bg_color"
    t.string   "height"
    t.string   "width"
  end

  add_index "admin_ad_bars", ["admin_campaign_id"], name: "index_admin_ad_bars_on_admin_campaign_id", using: :btree

  create_table "admin_ads", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "title"
    t.text     "subtitle"
    t.text     "url"
    t.integer  "admin_ad_bar_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "admin_ads", ["admin_ad_bar_id"], name: "index_admin_ads_on_admin_ad_bar_id", using: :btree

  create_table "admin_campaigns", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "admin_company_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "admin_campaigns", ["admin_company_id"], name: "index_admin_campaigns_on_admin_company_id", using: :btree

  create_table "admin_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "trading_name"
    t.string   "registration_number"
    t.text     "address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.text     "domain_url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "admin_ad_bars", "admin_campaigns"
  add_foreign_key "admin_ads", "admin_ad_bars"
  add_foreign_key "admin_campaigns", "admin_companies"
end
