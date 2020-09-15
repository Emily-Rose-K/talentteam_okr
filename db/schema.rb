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

ActiveRecord::Schema.define(version: 2020_09_15_213151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "nickname"
    t.string "email"
    t.boolean "enable"
    t.string "color"
  end

  create_table "milestones", force: :cascade do |t|
    t.string "name"
    t.boolean "is_done"
    t.bigint "project_id"
    t.datetime "completed_at"
    t.bigint "assignee_id"
    t.string "owner"
    t.date "due_date"
    t.bigint "okr_id"
    t.index ["assignee_id"], name: "index_milestones_on_assignee_id"
    t.index ["project_id"], name: "index_milestones_on_project_id"
  end

  create_table "okrs", force: :cascade do |t|
    t.string "objective"
    t.string "owner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "key_results"
    t.bigint "assignee_id"
    t.index ["assignee_id"], name: "index_okrs_on_assignee_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "owner"
    t.bigint "okr_id"
    t.string "name"
    t.bigint "assignee_id"
    t.date "due_date"
    t.index ["assignee_id"], name: "index_projects_on_assignee_id"
    t.index ["okr_id"], name: "index_projects_on_okr_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "milestones", "assignees"
  add_foreign_key "okrs", "assignees"
  add_foreign_key "projects", "assignees"
end
