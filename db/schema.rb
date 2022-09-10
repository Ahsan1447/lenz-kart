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

ActiveRecord::Schema[7.0].define(version: 2022_09_10_084908) do
  create_table "frames", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.integer "stock"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glasses", force: :cascade do |t|
    t.integer "lense_id", null: false
    t.integer "frame_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frame_id"], name: "index_glasses_on_frame_id"
    t.index ["lense_id"], name: "index_glasses_on_lense_id"
  end

  create_table "lenses", force: :cascade do |t|
    t.string "colour"
    t.text "description"
    t.string "prescription_type"
    t.string "string"
    t.string "lens_type"
    t.integer "stock"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "glasses", "frames"
  add_foreign_key "glasses", "lenses"
end
