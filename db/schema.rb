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

ActiveRecord::Schema.define(version: 20180410120255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "class_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_group_id"], name: "index_assignments_on_class_group_id"
    t.index ["test_id"], name: "index_assignments_on_test_id"
  end

  create_table "class_group_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "class_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_group_id"], name: "index_class_group_users_on_class_group_id"
    t.index ["user_id"], name: "index_class_group_users_on_user_id"
  end

  create_table "class_groups", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string "name"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "max_score"
    t.integer "paper_id"
    t.string "content"
    t.string "strand"
    t.string "summary"
    t.string "MW_number"
    t.string "MW_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question_number"
    t.integer "order"
    t.index ["paper_id"], name: "index_questions_on_paper_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "question_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_results_on_question_id"
    t.index ["student_id"], name: "index_results_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "class_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_group_id"], name: "index_students_on_class_group_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "tier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assignments", "class_groups"
  add_foreign_key "assignments", "tests"
  add_foreign_key "class_group_users", "class_groups"
  add_foreign_key "class_group_users", "users"
  add_foreign_key "papers", "tests"
  add_foreign_key "questions", "papers"
  add_foreign_key "results", "questions"
  add_foreign_key "results", "students"
  add_foreign_key "students", "class_groups"
end
