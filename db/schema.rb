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

ActiveRecord::Schema.define(version: 2021_01_24_114720) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "congestions", force: :cascade do |t|
    t.integer "count", null: false
    t.integer "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examinations", force: :cascade do |t|
    t.integer "reservation_id"
    t.integer "reception_id"
    t.string "diagnosis", default: "", null: false
    t.string "treatment", default: "", null: false
    t.integer "prescription_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "update_status", default: 0, null: false
    t.string "prescription_name"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "information_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.integer "theme_id", null: false
    t.string "subject", default: "", null: false
    t.string "image_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.date "birth_date", null: false
    t.integer "sex", null: false
    t.string "postal_code", default: "", null: false
    t.string "address", default: "", null: false
    t.string "tel", default: "", null: false
    t.boolean "is_unsubscribe_flag", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "receptions", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "congestion_id", null: false
    t.integer "number", null: false
    t.datetime "start_time", null: false
    t.integer "examination_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "examination_count", null: false
    t.string "symptom", default: "", null: false
    t.string "body_parts", default: "", null: false
    t.date "starting_point", null: false
    t.integer "treatment", null: false
    t.string "prescription", default: ""
    t.integer "side_effect", null: false
    t.string "other_diseases", default: ""
    t.string "hospital_name", default: ""
    t.integer "pregnancy", null: false
    t.integer "purpose", null: false
    t.string "request", default: ""
    t.integer "examination_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
