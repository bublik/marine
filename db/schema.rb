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

ActiveRecord::Schema.define(version: 20140412114940) do

  create_table "citizenships", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eyes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hairs", force: true do |t|
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "heights", force: true do |t|
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maritals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overallsizes", force: true do |t|
    t.integer  "overall_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personals", force: true do |t|
    t.datetime "available_from"
    t.integer  "salary_id"
    t.integer  "rank_id"
    t.string   "surname"
    t.string   "name"
    t.string   "middle_name"
    t.date     "pp_dob"
    t.string   "pp_pob"
    t.integer  "country_id"
    t.integer  "citizenship_id"
    t.integer  "marital_id"
    t.string   "sex"
    t.integer  "eye_id"
    t.integer  "hair_id"
    t.integer  "height_id"
    t.integer  "weight_id"
    t.integer  "overallsize_id"
    t.integer  "shoe_id"
    t.string   "taxation_id_code"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  add_index "personals", ["citizenship_id"], name: "index_personals_on_citizenship_id", using: :btree
  add_index "personals", ["country_id"], name: "index_personals_on_country_id", using: :btree
  add_index "personals", ["eye_id"], name: "index_personals_on_eye_id", using: :btree
  add_index "personals", ["hair_id"], name: "index_personals_on_hair_id", using: :btree
  add_index "personals", ["height_id"], name: "index_personals_on_height_id", using: :btree
  add_index "personals", ["marital_id"], name: "index_personals_on_marital_id", using: :btree
  add_index "personals", ["overallsize_id"], name: "index_personals_on_overallsize_id", using: :btree
  add_index "personals", ["rank_id"], name: "index_personals_on_rank_id", using: :btree
  add_index "personals", ["salary_id"], name: "index_personals_on_salary_id", using: :btree
  add_index "personals", ["shoe_id"], name: "index_personals_on_shoe_id", using: :btree
  add_index "personals", ["weight_id"], name: "index_personals_on_weight_id", using: :btree

  create_table "positions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salaries", force: true do |t|
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoes", force: true do |t|
    t.integer  "shoes_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weights", force: true do |t|
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
