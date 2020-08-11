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

ActiveRecord::Schema.define(version: 2020_08_11_112111) do

  create_table "campaigns", force: :cascade do |t|
    t.string "job_id", null: false
    t.integer "status", null: false
    t.string "external_reference", null: false
    t.text "ad_description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discrepancy_logs", force: :cascade do |t|
    t.text "discrepancies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
