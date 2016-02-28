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

ActiveRecord::Schema.define(version: 20160227230509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conjugated_verb_pairings", force: :cascade do |t|
    t.integer  "conjugated_verb_id"
    t.integer  "conjugated_verb_pair_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "conjugated_verb_pairings", ["conjugated_verb_id"], name: "index_conjugated_verb_pairings_on_conjugated_verb_id", using: :btree
  add_index "conjugated_verb_pairings", ["conjugated_verb_pair_id"], name: "index_conjugated_verb_pairings_on_conjugated_verb_pair_id", using: :btree

  create_table "conjugated_verb_pairs", force: :cascade do |t|
    t.integer  "verb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "conjugated_verb_pairs", ["verb_id"], name: "index_conjugated_verb_pairs_on_verb_id", using: :btree

  create_table "conjugated_verbs", force: :cascade do |t|
    t.integer  "form_id"
    t.integer  "language_id"
    t.string   "conjugation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "person_id"
  end

  add_index "conjugated_verbs", ["form_id"], name: "index_conjugated_verbs_on_form_id", using: :btree
  add_index "conjugated_verbs", ["language_id"], name: "index_conjugated_verbs_on_language_id", using: :btree
  add_index "conjugated_verbs", ["person_id"], name: "index_conjugated_verbs_on_person_id", using: :btree

  create_table "forms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verbal_aspects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verbs", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "verbal_aspect_id"
  end

  add_index "verbs", ["verbal_aspect_id"], name: "index_verbs_on_verbal_aspect_id", using: :btree

  add_foreign_key "conjugated_verb_pairings", "conjugated_verb_pairs"
  add_foreign_key "conjugated_verb_pairings", "conjugated_verbs"
  add_foreign_key "conjugated_verb_pairs", "verbs"
  add_foreign_key "conjugated_verbs", "forms"
  add_foreign_key "conjugated_verbs", "languages"
  add_foreign_key "conjugated_verbs", "people"
  add_foreign_key "verbs", "verbal_aspects"
end
