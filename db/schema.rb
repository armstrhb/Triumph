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

ActiveRecord::Schema.define(version: 20150616014047) do

  create_table "achievements", force: :cascade do |t|
    t.string   "title",          limit: 255,                 null: false
    t.integer  "realm_id",       limit: 4
    t.integer  "category_id",    limit: 4
    t.integer  "rarity_id",      limit: 4
    t.integer  "points",         limit: 4
    t.date     "active_start"
    t.date     "active_end"
    t.boolean  "repeatable",     limit: 1,   default: false
    t.integer  "required_ticks", limit: 4
    t.string   "description",    limit: 255,                 null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255,                     null: false
    t.string   "description", limit: 255,                     null: false
    t.integer  "realm_id",    limit: 4
    t.integer  "icon_id",     limit: 4
    t.string   "color",       limit: 255, default: "#c0c0c0"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "admin_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name", using: :btree

  create_table "icons", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer  "achievement_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.integer  "ticks",          limit: 4, default: 0
    t.boolean  "completed",      limit: 1, default: false
    t.datetime "complete_date"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "progresses", ["achievement_id"], name: "index_progresses_on_achievement_id", using: :btree
  add_index "progresses", ["user_id"], name: "index_progresses_on_user_id", using: :btree

  create_table "rarities", force: :cascade do |t|
    t.string   "name",        limit: 255,                     null: false
    t.integer  "realm_id",    limit: 4
    t.integer  "icon_id",     limit: 4
    t.string   "color",       limit: 255, default: "#c0c0c0"
    t.integer  "rareness",    limit: 4,                       null: false
    t.string   "description", limit: 255,                     null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "rarities", ["name"], name: "index_rarities_on_name", using: :btree

  create_table "realm_users", id: false, force: :cascade do |t|
    t.integer "realm_id", limit: 4
    t.integer "user_id",  limit: 4
  end

  add_index "realm_users", ["realm_id"], name: "index_realm_users_on_realm_id", using: :btree
  add_index "realm_users", ["user_id"], name: "index_realm_users_on_user_id", using: :btree

  create_table "realms", force: :cascade do |t|
    t.string   "name",       limit: 255,                     null: false
    t.boolean  "active",     limit: 1,   default: true
    t.integer  "group_id",   limit: 4
    t.integer  "icon_id",    limit: 4
    t.string   "color",      limit: 255, default: "#c0c0c0"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "sys_configs", force: :cascade do |t|
    t.string   "key",        limit: 255, null: false
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sys_configs", ["key"], name: "index_sys_configs_on_key", using: :btree

  create_table "user_groups", id: false, force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.integer "group_id", limit: 4
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id", using: :btree
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id", using: :btree

  create_table "user_tracked_achievements", id: false, force: :cascade do |t|
    t.integer "user_id",        limit: 4
    t.integer "achievement_id", limit: 4
  end

  add_index "user_tracked_achievements", ["achievement_id"], name: "index_user_tracked_achievements_on_achievement_id", using: :btree
  add_index "user_tracked_achievements", ["user_id"], name: "index_user_tracked_achievements_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255,                null: false
    t.string   "email",           limit: 255,                null: false
    t.string   "password_digest", limit: 255
    t.boolean  "active",          limit: 1,   default: true
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", using: :btree

end
