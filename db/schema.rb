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

ActiveRecord::Schema.define(version: 20140519134025) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "certificates", force: true do |t|
    t.integer  "cert_id"
    t.integer  "country_id"
    t.boolean  "is_flag"
    t.string   "issuer"
    t.date     "from_date"
    t.date     "to_date"
    t.boolean  "is_unlimited"
    t.string   "licence_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",        null: false
  end

  add_index "certificates", ["cert_id"], name: "index_certificates_on_cert_id", using: :btree
  add_index "certificates", ["country_id"], name: "index_certificates_on_country_id", using: :btree

  create_table "certs", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_on_wizard", default: false
  end

  create_table "citizenships", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "country_id"
    t.string   "region"
    t.string   "city"
    t.string   "street"
    t.string   "postal_code"
    t.string   "airport"
    t.string   "phone"
    t.string   "mphone"
    t.string   "email"
    t.string   "skype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     null: false
    t.string   "next_of_kin"
    t.string   "name"
  end

  add_index "contacts", ["country_id"], name: "index_contacts_on_country_id", using: :btree

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

  create_table "langs", force: true do |t|
    t.integer  "language_id"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     null: false
  end

  add_index "langs", ["language_id"], name: "index_langs_on_language_id", using: :btree

  create_table "languages", force: true do |t|
    t.string   "name"
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
    t.integer  "salary"
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
    t.integer  "user_id",           null: false
    t.string   "required_position"
  end

  add_index "personals", ["citizenship_id"], name: "index_personals_on_citizenship_id", using: :btree
  add_index "personals", ["country_id"], name: "index_personals_on_country_id", using: :btree
  add_index "personals", ["eye_id"], name: "index_personals_on_eye_id", using: :btree
  add_index "personals", ["hair_id"], name: "index_personals_on_hair_id", using: :btree
  add_index "personals", ["height_id"], name: "index_personals_on_height_id", using: :btree
  add_index "personals", ["marital_id"], name: "index_personals_on_marital_id", using: :btree
  add_index "personals", ["overallsize_id"], name: "index_personals_on_overallsize_id", using: :btree
  add_index "personals", ["rank_id"], name: "index_personals_on_rank_id", using: :btree
  add_index "personals", ["salary"], name: "index_personals_on_salary", using: :btree
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

  create_table "seaservices", force: true do |t|
    t.string   "vessel_name"
    t.integer  "vessel_country_code_id"
    t.string   "vessel_year"
    t.integer  "vessel_type_id"
    t.string   "vessel_dwt"
    t.string   "vessel_engine_model"
    t.integer  "vessel_engine_power"
    t.integer  "rank_id"
    t.date     "on_date"
    t.date     "off_date"
    t.string   "owner_name"
    t.string   "agent_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                null: false
    t.string   "vessel_engine"
  end

  add_index "seaservices", ["rank_id"], name: "index_seaservices_on_rank_id", using: :btree
  add_index "seaservices", ["vessel_country_code_id"], name: "index_seaservices_on_vessel_country_code_id", using: :btree
  add_index "seaservices", ["vessel_type_id"], name: "index_seaservices_on_vessel_type_id", using: :btree

  create_table "shoes", force: true do |t|
    t.integer  "shoes_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
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
    t.string   "authentication_token",   default: ""
    t.boolean  "accept_subscription",    default: true
    t.string   "uuid",                                  null: false
    t.datetime "cv_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vessel_country_codes", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vessel_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weights", force: true do |t|
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
