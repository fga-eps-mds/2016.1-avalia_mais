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

ActiveRecord::Schema.define(version: 20160411165401) do

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name",          limit: 255
    t.text     "address",       limit: 65535
    t.string   "UF",            limit: 255
    t.string   "telephone",     limit: 255
    t.string   "email",         limit: 255
    t.boolean  "authenticated"
    t.text     "description",   limit: 65535
    t.integer  "segment_id",    limit: 4
  end

  add_index "companies", ["segment_id"], name: "index_companies_on_segment_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "response_time", limit: 4
    t.integer  "grade",         limit: 4
    t.string   "resolved",      limit: 255
    t.string   "uf",            limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "company_id",    limit: 4
  end

  add_index "evaluations", ["company_id"], name: "index_evaluations_on_company_id", using: :btree

  create_table "parsers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "segments", force: :cascade do |t|
    t.text     "segment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "companies", "segments"
  add_foreign_key "evaluations", "companies"
end
