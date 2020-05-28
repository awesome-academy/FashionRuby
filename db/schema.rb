# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_27_213941) do

  create_table "canpaigns", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "catelogies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.integer "product_id", null: false
    t.text "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "orderdetails", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.datetime "senddate"
    t.integer "quanity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_orderdetails_on_order_id"
    t.index ["product_id"], name: "index_orderdetails_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "orderdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "catelogy_id", null: false
    t.integer "price"
    t.integer "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catelogy_id"], name: "index_products_on_catelogy_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "products_id", null: false
    t.integer "canpaign_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["canpaign_id"], name: "index_sales_on_canpaign_id"
    t.index ["products_id"], name: "index_sales_on_products_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "admin"
    t.boolean "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "images", "products"
  add_foreign_key "orderdetails", "orders"
  add_foreign_key "orderdetails", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "catelogies"
  add_foreign_key "sales", "canpaigns"
  add_foreign_key "sales", "products", column: "products_id"
end
