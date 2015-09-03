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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150902194325) do

  create_table "identities", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "identities", ["user_id"], :name => "index_identities_on_user_id"

  create_table "items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "meal_id"
    t.string   "name"
    t.float    "price"
    t.string   "picture_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "meals", :force => true do |t|
    t.string   "name"
    t.float    "tip"
    t.float    "tax"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "picture_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "meal_id"
    t.string   "role",       :default => "participant"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                :default => "", :null => false
    t.string   "name"
    t.string   "authentication_token"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
