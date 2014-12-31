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

ActiveRecord::Schema.define(version: 20141231082730) do

  create_table "startups", force: :cascade do |t|
    t.string   "name",            limit: 255,               null: false
    t.string   "company_name",    limit: 255,               null: false
    t.string   "address",         limit: 255,               null: false
    t.string   "company_url",     limit: 255
    t.text     "description",     limit: 65535
    t.integer  "like_count",      limit: 4,     default: 0
    t.text     "logo_url",        limit: 65535
    t.integer  "employee_count",  limit: 4
    t.integer  "job_count",       limit: 4
    t.float    "lat",             limit: 24
    t.float    "lng",             limit: 24
    t.float    "vlat",            limit: 24
    t.float    "vlng",            limit: 24
    t.string   "area",            limit: 255
    t.string   "category",        limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "foundation_date", limit: 255
  end

  add_index "startups", ["lat"], name: "index_startups_on_lat", using: :btree
  add_index "startups", ["like_count"], name: "index_startups_on_like_count", using: :btree
  add_index "startups", ["lng"], name: "index_startups_on_lng", using: :btree
  add_index "startups", ["name"], name: "index_startups_on_name", unique: true, using: :btree

end
