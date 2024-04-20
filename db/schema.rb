# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_04_06_123326) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "calculations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "comment_id"
    t.integer "favirite_id"
    t.integer "temperature"
    t.integer "tag_id"
    t.text "memo"
    t.string "image"
    t.text "title", null: false
    t.text "subtitle"
    t.integer "release_status", default: 0, null: false
    t.datetime "burning_date"
    t.string "knao"
    t.string "li2o"
    t.string "mgo"
    t.string "cao"
    t.string "sro"
    t.string "bao"
    t.string "zno"
    t.string "al203"
    t.string "sios"
    t.string "amount"
    t.string "fukushimafeldspar"
    t.string "lithiumcarbonate"
    t.string "magnesite"
    t.string "whitelimestone"
    t.string "strontiumcarbonate"
    t.string "bariumcarbonate"
    t.string "zincoxide"
    t.string "kaolin"
    t.string "fukushimasilica"
    t.string "additive1"
    t.string "additive2"
    t.string "additive3"
    t.string "additive4"
    t.string "additive5"
    t.string "additive1_amount"
    t.string "additive2_amount"
    t.string "additive3_amount"
    t.string "additive4_amount"
    t.string "additive5_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "calculation_id", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "calculation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tag_relations", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "calculation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.text "introduction"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
