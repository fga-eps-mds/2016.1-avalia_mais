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

ActiveRecord::Schema.define(version: 20160613121833) do

  create_table "attaches", force: :cascade do |t|
    t.string   "cnpj",               limit: 255
    t.string   "address",            limit: 255
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id",            limit: 4
    t.integer  "company_id",         limit: 4
  end

  add_index "attaches", ["company_id"], name: "index_attaches_on_company_id", using: :btree
  add_index "attaches", ["user_id"], name: "index_attaches_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "description",     limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "topic_id",        limit: 4
    t.integer  "user_id",         limit: 4
    t.integer  "denunciation_id", limit: 4
  end

  add_index "comments", ["denunciation_id"], name: "index_comments_on_denunciation_id", using: :btree
  add_index "comments", ["topic_id"], name: "index_comments_on_topic_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.float    "response_time",     limit: 24
    t.float    "rate",              limit: 24
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name",              limit: 255
    t.text     "address",           limit: 65535
    t.string   "telephone",         limit: 255
    t.string   "email",             limit: 255
    t.boolean  "authenticated"
    t.text     "description",       limit: 65535
    t.integer  "segment_id",        limit: 4
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
    t.integer  "uf_id",             limit: 4
    t.integer  "user_id",           limit: 4
  end

  add_index "companies", ["segment_id"], name: "index_companies_on_segment_id", using: :btree
  add_index "companies", ["uf_id"], name: "index_companies_on_uf_id", using: :btree
  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "company_denunciations", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "company_id",  limit: 4
    t.integer  "user_id",     limit: 4
  end

  add_index "company_denunciations", ["company_id"], name: "index_company_denunciations_on_company_id", using: :btree
  add_index "company_denunciations", ["user_id"], name: "index_company_denunciations_on_user_id", using: :btree

  create_table "denunciations", force: :cascade do |t|
    t.integer "user_id",    limit: 4
    t.integer "topic_id",   limit: 4
    t.integer "comment_id", limit: 4
  end

  add_index "denunciations", ["comment_id"], name: "index_denunciations_on_comment_id", using: :btree
  add_index "denunciations", ["topic_id"], name: "index_denunciations_on_topic_id", using: :btree
  add_index "denunciations", ["user_id"], name: "index_denunciations_on_user_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "response_time", limit: 4
    t.integer  "grade",         limit: 4
    t.string   "resolved",      limit: 255
    t.integer  "rate",          limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "company_id",    limit: 4
    t.integer  "uf_id",         limit: 4
    t.integer  "user_id",       limit: 4
  end

  add_index "evaluations", ["company_id"], name: "index_evaluations_on_company_id", using: :btree
  add_index "evaluations", ["uf_id"], name: "index_evaluations_on_uf_id", using: :btree
  add_index "evaluations", ["user_id"], name: "index_evaluations_on_user_id", using: :btree

  create_table "faqs", force: :cascade do |t|
    t.string   "question",   limit: 255
    t.string   "answer",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "company_id", limit: 4
  end

  add_index "faqs", ["company_id"], name: "index_faqs_on_company_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "question_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parsers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",                   limit: 255
    t.integer  "options_quantity_chosen", limit: 4
    t.integer  "company_id",              limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "body",            limit: 255
    t.date     "create_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "company_id",      limit: 4
    t.integer  "user_id",         limit: 4
    t.integer  "denunciation_id", limit: 4
  end

  add_index "topics", ["company_id"], name: "index_topics_on_company_id", using: :btree
  add_index "topics", ["denunciation_id"], name: "index_topics_on_denunciation_id", using: :btree
  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "ufs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "gender",          limit: 255
    t.string   "password_digest", limit: 255
    t.string   "login",           limit: 255
    t.date     "dateBirthday"
    t.string   "image",           limit: 255
    t.boolean  "active"
    t.boolean  "admin"
    t.integer  "uf_id",           limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "option_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "attaches", "companies"
  add_foreign_key "attaches", "users"
  add_foreign_key "comments", "denunciations"
  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "companies", "segments"
  add_foreign_key "companies", "ufs"
  add_foreign_key "companies", "users"
  add_foreign_key "company_denunciations", "companies"
  add_foreign_key "company_denunciations", "users"
  add_foreign_key "denunciations", "comments"
  add_foreign_key "denunciations", "topics"
  add_foreign_key "denunciations", "users"
  add_foreign_key "evaluations", "companies"
  add_foreign_key "evaluations", "ufs"
  add_foreign_key "evaluations", "users"
  add_foreign_key "faqs", "companies"
  add_foreign_key "topics", "companies"
  add_foreign_key "topics", "denunciations"
  add_foreign_key "topics", "users"
end
