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

ActiveRecord::Schema.define(version: 20161112100740) do

  create_table "author_books", force: :cascade do |t|
    t.integer  "author_id",  limit: 4
    t.integer  "book_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "author_books", ["author_id"], name: "index_author_books_on_author_id", using: :btree
  add_index "author_books", ["book_id"], name: "index_author_books_on_book_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.string   "country_of_origin", limit: 255
    t.text     "mini_bio",          limit: 65535
    t.string   "wiki_link",         limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "books", force: :cascade do |t|
    t.text     "name",           limit: 65535
    t.string   "isbn13",         limit: 17
    t.string   "isbn10",         limit: 13
    t.string   "cover_type",     limit: 255
    t.string   "language",       limit: 255
    t.string   "publisher",      limit: 255
    t.datetime "published_year"
    t.string   "genre",          limit: 255
    t.string   "category",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "borrowers", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "mobile_number", limit: 10
    t.string   "city",          limit: 255
    t.string   "state",         limit: 255
    t.string   "country",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "collections", force: :cascade do |t|
    t.integer  "book_id",      limit: 4
    t.integer  "total_copies", limit: 4, default: 0
    t.integer  "lost_copies",  limit: 4, default: 0
    t.integer  "checked_out",  limit: 4, default: 0
    t.integer  "library_id",   limit: 4
    t.integer  "rowrack_id",   limit: 4
    t.integer  "row_id",       limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.text     "name",           limit: 65535
    t.text     "address",        limit: 65535
    t.string   "city",           limit: 255
    t.string   "state",          limit: 255
    t.string   "country",        limit: 255
    t.integer  "total_capacity", limit: 4,     default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "rowracks", force: :cascade do |t|
    t.integer  "library_id", limit: 4
    t.string   "category",   limit: 255
    t.string   "genre",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rows", force: :cascade do |t|
    t.integer  "rowrack_id", limit: 4
    t.integer  "library_id", limit: 4
    t.string   "row_number", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
