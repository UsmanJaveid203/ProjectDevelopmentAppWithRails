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

ActiveRecord::Schema.define(version: 2021_03_17_092909) do

  create_table "bugs", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.string "status"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.index ["project_id"], name: "index_bugs_on_project_id"
    t.index ["user_id"], name: "index_bugs_on_user_id"
  end

  create_table "developerbugs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "bug_id", null: false
    t.index ["bug_id"], name: "index_developerbugs_on_bug_id"
    t.index ["user_id"], name: "index_developerbugs_on_user_id"
  end

  create_table "developerprojects", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.index ["project_id"], name: "index_developerprojects_on_project_id"
    t.index ["user_id"], name: "index_developerprojects_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bugs", "projects"
  add_foreign_key "bugs", "users"
  add_foreign_key "developerbugs", "bugs"
  add_foreign_key "developerbugs", "users"
  add_foreign_key "developerprojects", "projects"
  add_foreign_key "developerprojects", "users"
  add_foreign_key "projects", "users"
end
