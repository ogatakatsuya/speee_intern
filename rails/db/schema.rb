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

ActiveRecord::Schema[7.1].define(version: 2024_08_21_081437) do
  create_table "assessable_areas", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_assessable_areas_on_branch_id"
    t.index ["city_id"], name: "index_assessable_areas_on_city_id"
  end

  create_table "branches", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "post_code", null: false
    t.string "phone_number", null: false
    t.string "fax_number", null: false
    t.string "open_hours", null: false
    t.string "closed_days", null: false
    t.string "catch_copy", null: false
    t.text "introduction", null: false
    t.string "street_address", null: false
    t.integer "ieul_branch_id", null: false
    t.bigint "company_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_branches_on_city_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "yomikata", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prefecture_id"
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "logo_url", null: false
    t.integer "ieul_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "gender_id", null: false
    t.integer "age", null: false
    t.string "address", null: false
    t.integer "property_type_id", null: false
    t.integer "sales_count_id", null: false
    t.date "sale_consideration_period", null: false
    t.date "appraisal_request_period", null: false
    t.date "listing_period", null: false
    t.date "sale_period", null: false
    t.date "transfer_period", null: false
    t.bigint "appraisal_price", null: false
    t.bigint "sale_price", null: false
    t.boolean "discounted", default: false, null: false
    t.integer "months_to_discount"
    t.bigint "discount_price"
    t.bigint "contract_price", null: false
    t.integer "contract_type_id", null: false
    t.string "headline", null: false
    t.integer "sale_reason_id", null: false
    t.text "concerns_at_sale", null: false
    t.text "chosen_company_reason", null: false
    t.integer "company_satisfaction_id", null: false
    t.text "company_satisfaction_reason", null: false
    t.text "advice_for_future_sellers", null: false
    t.text "areas_for_improvement"
    t.boolean "public", default: false, null: false
    t.integer "ieul_store_id", null: false
    t.bigint "branch_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_reviews_on_branch_id"
    t.index ["city_id"], name: "index_reviews_on_city_id"
  end

  add_foreign_key "assessable_areas", "branches"
  add_foreign_key "assessable_areas", "cities"
  add_foreign_key "branches", "cities"
  add_foreign_key "branches", "companies"
  add_foreign_key "cities", "prefectures"
  add_foreign_key "reviews", "branches"
  add_foreign_key "reviews", "cities"
end
