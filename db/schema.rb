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

ActiveRecord::Schema.define(:version => 20110718044556) do

  create_table "admins", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "about"
    t.integer  "author_id"
    t.text     "skills"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["author_id"], :name => "index_events_on_author_id"

  create_table "live_streams", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "event_id"
  end

  add_index "live_streams", ["post_id"], :name => "index_live_streams_on_post_id"
  add_index "live_streams", ["project_id"], :name => "index_live_streams_on_project_id"
  add_index "live_streams", ["user_id"], :name => "index_live_streams_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "about"
    t.string   "url"
    t.string   "source_url"
    t.text     "skills"
    t.integer  "author_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["author_id"], :name => "index_projects_on_author_id"
  add_index "projects", ["status_id"], :name => "index_projects_on_status_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
