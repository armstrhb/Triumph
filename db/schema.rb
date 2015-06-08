# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150607190013) do

  create_table "achievements", force: :cascade do |t|
    t.string   "title",                          null: false
    t.integer  "realm_id"
    t.integer  "category_id"
    t.integer  "rarity_id"
    t.integer  "points"
    t.date     "active_start"
    t.date     "active_end"
    t.boolean  "repeatable",     default: false
    t.integer  "required_ticks"
    t.string   "description",                    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "description",                     null: false
    t.integer  "realm_id"
    t.integer  "icon_id"
    t.string   "color",       default: "#c0c0c0"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name"

  create_table "groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name"

  create_table "icons", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer  "achievement_id"
    t.integer  "user_id"
    t.integer  "ticks",          default: 0
    t.boolean  "completed",      default: false
    t.datetime "complete_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "progresses", ["achievement_id"], name: "index_progresses_on_achievement_id"
  add_index "progresses", ["user_id"], name: "index_progresses_on_user_id"

  create_table "rarities", force: :cascade do |t|
    t.string   "name",                            null: false
    t.integer  "realm_id"
    t.integer  "icon_id"
    t.string   "color",       default: "#c0c0c0"
    t.integer  "rareness",                        null: false
    t.string   "description",                     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "rarities", ["name"], name: "index_rarities_on_name"

  create_table "realm_users", id: false, force: :cascade do |t|
    t.integer "realm_id"
    t.integer "user_id"
  end

  add_index "realm_users", ["realm_id"], name: "index_realm_users_on_realm_id"
  add_index "realm_users", ["user_id"], name: "index_realm_users_on_user_id"

  create_table "realms", force: :cascade do |t|
    t.string   "name",                           null: false
    t.boolean  "active",     default: true
    t.integer  "group_id"
    t.integer  "icon_id"
    t.string   "color",      default: "#c0c0c0"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "user_groups", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id"
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "email",                          null: false
    t.string   "password_digest"
    t.boolean  "active",          default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "users", ["name"], name: "index_users_on_name"

end
