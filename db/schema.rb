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

ActiveRecord::Schema.define(version: 2023_08_05_120136) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "soft_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["soft_id"], name: "index_bookmarks_on_soft_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.text "contant", null: false
    t.boolean "is_notice", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "soft_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "facilitiy_id", null: false
    t.text "content", null: false
    t.boolean "is_public", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "soft_edit_notices", force: :cascade do |t|
    t.string "user_id", null: false
    t.string "soft_info_id", null: false
    t.boolean "is_notice", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "softkmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "soft_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["soft_id"], name: "index_softkmarks_on_soft_id"
    t.index ["user_id"], name: "index_softkmarks_on_user_id"
  end

  create_table "softmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "soft_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["soft_id"], name: "index_softmarks_on_soft_id"
    t.index ["user_id"], name: "index_softmarks_on_user_id"
  end

  create_table "softs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "work_id", null: false
    t.integer "impressions_count", default: 0
    t.string "company", null: false
    t.string "address", null: false
    t.string "founding"
    t.string "url", null: false
    t.text "introduction", null: false
    t.integer "first_cost"
    t.integer "month_cost"
    t.integer "year_cost"
    t.text "function"
    t.boolean "is_public", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "profile_id", null: false
    t.text "content", null: false
    t.boolean "is_public", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_services", force: :cascade do |t|
    t.integer "use_id"
    t.integer "service_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usermarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id"], name: "index_usermarks_on_facility_id"
    t.index ["user_id"], name: "index_usermarks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "employee", default: "", null: false
    t.integer "impressions_count", default: 0
    t.integer "service_id"
    t.string "account_soft", default: "会計使用ソフト"
    t.text "account_reason", default: "そのソフトを使用している理由"
    t.string "accounting_soft", default: "経理使用ソフト"
    t.text "accounting_reason", default: "そのソフトを使用している理由"
    t.string "other_soft", default: "その他会計・経理使用ソフト"
    t.text "other_reason", default: "そのソフトを使用している理由"
    t.string "salary_soft", default: "給料計算使用ソフト"
    t.text "salary_reason", default: "そのソフトを使用している理由"
    t.string "working_hours_soft", default: "出退勤管理使用ソフト"
    t.text "working_hours_reason", default: "そのソフトを使用している理由"
    t.string "communication_soft", default: "法人内コミュニケーションツール"
    t.text "communication_reason", default: "そのツールを使用している理由"
    t.string "customer_info_soft", default: "利用者情報管理ソフト"
    t.text "customer_info_reason", default: "そのソフトを使用している理由"
    t.string "customer_deposit_soft", default: "利用者預り金管理ソフト"
    t.text "customer_deposit_reason", default: "そのソフトを使用している理由"
    t.string "customer_billing_soft", default: "利用者請求ソフト"
    t.text "customer_billing_reason", default: "そのソフトを使用している理由"
    t.boolean "is_public", default: false
    t.boolean "is_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string "kind", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookmarks", "softs"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "softkmarks", "softs"
  add_foreign_key "softkmarks", "users"
  add_foreign_key "softmarks", "softs"
  add_foreign_key "softmarks", "users"
  add_foreign_key "usermarks", "facilities"
  add_foreign_key "usermarks", "users"
end
