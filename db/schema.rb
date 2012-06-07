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

ActiveRecord::Schema.define(:version => 20120321052654) do

  create_table "orders", :force => true do |t|
    t.integer  "parent_order_id"
    t.datetime "date_created"
    t.string   "status"
    t.string   "customer_message"
    t.boolean  "is_deleted"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "description"
    t.float    "base_price"
    t.integer  "quantity"
    t.string   "brand_id"
    t.integer  "order_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "brand_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
