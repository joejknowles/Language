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

ActiveRecord::Schema.define(version: 20160305165944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grammatical_categories", force: :cascade do |t|
    t.string   "grammatical_category_name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "grammemes", force: :cascade do |t|
    t.integer  "grammatical_category_id"
    t.string   "grammeme_name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "grammemes", ["grammatical_category_id"], name: "index_grammemes_on_grammatical_category_id", using: :btree

  create_table "inflected_words", force: :cascade do |t|
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "word"
  end

  add_index "inflected_words", ["language_id"], name: "index_inflected_words_on_language_id", using: :btree

  create_table "inflected_words_groupings", force: :cascade do |t|
    t.integer  "inflected_words_group_id"
    t.integer  "inflected_word_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "inflected_words_groupings", ["inflected_word_id"], name: "index_inflected_words_groupings_on_inflected_word_id", using: :btree
  add_index "inflected_words_groupings", ["inflected_words_group_id"], name: "index_inflected_words_groupings_on_inflected_words_group_id", using: :btree

  create_table "inflected_words_groups", force: :cascade do |t|
    t.integer  "word_family_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "inflected_words_groups", ["word_family_id"], name: "index_inflected_words_groups_on_word_family_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "language_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "word_classes", force: :cascade do |t|
    t.string   "word_class_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "word_families", force: :cascade do |t|
    t.integer  "word_class_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "word_families", ["word_class_id"], name: "index_word_families_on_word_class_id", using: :btree

  create_table "word_grammemes", force: :cascade do |t|
    t.integer  "grammeme_id"
    t.integer  "inflected_word_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "word_grammemes", ["grammeme_id"], name: "index_word_grammemes_on_grammeme_id", using: :btree
  add_index "word_grammemes", ["inflected_word_id"], name: "index_word_grammemes_on_inflected_word_id", using: :btree

  add_foreign_key "grammemes", "grammatical_categories"
  add_foreign_key "inflected_words", "languages"
  add_foreign_key "inflected_words_groupings", "inflected_words"
  add_foreign_key "inflected_words_groupings", "inflected_words_groups"
  add_foreign_key "inflected_words_groups", "word_families"
  add_foreign_key "word_families", "word_classes"
  add_foreign_key "word_grammemes", "grammemes"
  add_foreign_key "word_grammemes", "inflected_words"
end
