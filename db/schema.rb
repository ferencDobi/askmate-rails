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

ActiveRecord::Schema.define(version: 2019_03_13_143616) do

  create_table "answer_votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "answer_id"
    t.integer "direction", default: 0
    t.index ["answer_id"], name: "index_answer_votes_on_answer_id"
    t.index ["user_id", "answer_id"], name: "index_answer_votes_on_user_id_and_answer_id", unique: true
    t.index ["user_id"], name: "index_answer_votes_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.text "message"
    t.string "image"
    t.integer "upvotes", default: 0
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "question_votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.integer "direction", default: 0
    t.index ["question_id"], name: "index_question_votes_on_question_id"
    t.index ["user_id", "question_id"], name: "index_question_votes_on_user_id_and_question_id", unique: true
    t.index ["user_id"], name: "index_question_votes_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "message"
    t.string "image"
    t.integer "upvotes", default: 0
    t.integer "views", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
