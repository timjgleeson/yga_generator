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

ActiveRecord::Schema.define(version: 20141031055528) do

  create_table "calendars", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", force: true do |t|
    t.string   "title"
    t.string   "type"
    t.integer  "calendar_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.integer  "position"
    t.string   "embed_url"
  end

  add_index "components", ["calendar_id"], name: "index_components_on_calendar_id"
  add_index "components", ["page_id"], name: "index_components_on_page_id"

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "date_start"
    t.datetime "date_end"
    t.text     "body"
    t.float    "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "calendar_id"
    t.integer  "position"
  end

  add_index "events", ["calendar_id"], name: "index_events_on_calendar_id"

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.boolean  "is_published", default: true
  end

end
