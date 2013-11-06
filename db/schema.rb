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

ActiveRecord::Schema.define(:version => 20131106123845) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "image"
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "coupons", :force => true do |t|
    t.string   "code"
    t.boolean  "status"
    t.date     "valid_to"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "discount"
  end

  create_table "design_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "designs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status",             :default => true
    t.string   "image"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "design_category_id"
  end

  create_table "images", :force => true do |t|
    t.string   "image"
    t.string   "thing_type"
    t.integer  "thing_id"
    t.boolean  "status",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.string   "size"
    t.string   "material"
    t.text     "notes"
    t.integer  "user_item_id"
    t.string   "per_product_price"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "shipping_address"
    t.string   "shipping_country"
    t.string   "shipping_state"
    t.string   "shipping_city"
    t.string   "shipping_zip_code"
    t.string   "contact_number"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.integer  "currency"
    t.string   "payment_status"
    t.integer  "user_item_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "prices", :force => true do |t|
    t.integer  "product_id"
    t.integer  "amount"
    t.string   "currency"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_attributes", :force => true do |t|
    t.integer  "product_id"
    t.string   "attribute_name"
    t.integer  "price"
    t.string   "currency"
    t.boolean  "status",         :default => true
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.string   "image"
    t.text     "description"
    t.boolean  "status",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "user_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.string   "image"
    t.text     "design"
    t.string   "title"
    t.boolean  "status",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "username"
    t.string   "last_name"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "mobile"
    t.string   "address"
    t.string   "address1"
    t.string   "user_role"
    t.boolean  "status",                 :default => true
    t.boolean  "is_admin",               :default => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
