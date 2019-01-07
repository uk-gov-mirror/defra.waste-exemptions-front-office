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

ActiveRecord::Schema.define(version: 20181231102738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "address_type",        default: 0
    t.integer  "mode",                default: 0
    t.string   "uprn"
    t.string   "organisation"
    t.string   "premises"
    t.string   "street_address"
    t.string   "locality"
    t.string   "city"
    t.string   "postcode"
    t.float    "x"
    t.float    "y"
    t.string   "coordinate_system"
    t.string   "blpu_state_code"
    t.string   "postal_address_code"
    t.string   "logical_status_code"
    t.string   "source_data_type"
    t.string   "country_iso"
    t.string   "grid_reference"
    t.text     "description"
    t.integer  "registration_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "addresses", ["registration_id"], name: "index_addresses_on_registration_id", using: :btree

  create_table "exemptions", force: :cascade do |t|
    t.integer "category"
    t.string  "code"
    t.string  "url"
    t.string  "summary"
    t.text    "description"
    t.text    "guidance"
  end

  create_table "interims", force: :cascade do |t|
    t.string   "operator_postcode"
    t.string   "contact_postcode"
    t.string   "site_postcode"
    t.string   "grid_reference"
    t.text     "site_description"
    t.boolean  "address_finder_error", default: false
    t.integer  "registration_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "interims", ["registration_id"], name: "index_interims_on_registration_id", using: :btree

  create_table "registration_exemptions", force: :cascade do |t|
    t.string   "state"
    t.date     "registered_on"
    t.date     "expires_on"
    t.integer  "registration_id"
    t.integer  "exemption_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "registration_exemptions", ["exemption_id"], name: "index_registration_exemptions_on_exemption_id", using: :btree
  add_index "registration_exemptions", ["registration_id"], name: "index_registration_exemptions_on_registration_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.string   "token"
    t.string   "reference"
    t.string   "workflow_state"
    t.string   "start_option"
    t.string   "location"
    t.string   "applicant_first_name"
    t.string   "applicant_last_name"
    t.string   "applicant_phone"
    t.string   "applicant_email"
    t.string   "business_type"
    t.string   "operator_name"
    t.string   "company_no"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_position"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.boolean  "is_a_farm"
    t.boolean  "on_a_farm"
    t.boolean  "declaration"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "registrations", ["reference"], name: "index_registrations_on_reference", unique: true, using: :btree
  add_index "registrations", ["token"], name: "index_registrations_on_token", unique: true, using: :btree

  add_foreign_key "addresses", "registrations"
  add_foreign_key "interims", "registrations"
end
