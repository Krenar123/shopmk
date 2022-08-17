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

ActiveRecord::Schema.define(version: 2022_08_15_212803) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "reference"
    t.integer "parent_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "icon"
    t.index ["name"], name: "index_categories_on_name", unique: true
    t.index ["parent_category_id"], name: "index_categories_on_parent_category_id"
    t.index ["reference"], name: "index_categories_on_reference", unique: true
  end

  create_table "eikonas", force: :cascade do |t|
    t.string "path_ref"
    t.integer "proion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "best"
    t.index ["proion_id"], name: "index_eikonas_on_proion_id"
  end

  create_table "hrists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_hrists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_hrists_on_reset_password_token", unique: true
  end

  create_table "proions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "size"
    t.string "previous_price"
    t.text "long_description"
    t.string "energy"
    t.string "fat"
    t.string "carbs"
    t.string "fibre"
    t.string "protein"
    t.string "salt"
    t.string "sugar"
    t.integer "category_id"
    t.index ["category_id"], name: "index_proions_on_category_id"
  end

  create_table "tagged_products", force: :cascade do |t|
    t.integer "proion_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proion_id"], name: "index_tagged_products_on_proion_id"
    t.index ["tag_id"], name: "index_tagged_products_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "reference"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  add_foreign_key "categories", "categories", column: "parent_category_id"
  add_foreign_key "eikonas", "proions"
  add_foreign_key "tagged_products", "proions"
  add_foreign_key "tagged_products", "tags"
end
