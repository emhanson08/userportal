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

ActiveRecord::Schema.define(version: 20180528194845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "clinician_id"
    t.datetime "date_scheduled"
    t.datetime "date_of_service"
    t.integer "canceled"
    t.integer "no_show"
    t.integer "clinic"
  end

  create_table "clinicians", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "clinic"
    t.integer "target_patients_per_day"
    t.integer "days_working"
    t.string "specialty_1"
    t.string "specialty_2"
    t.string "specialty_3"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "email"
    t.string "referral_channel"
    t.string "diagnosis"
    t.integer "primary_clinician"
  end

end
