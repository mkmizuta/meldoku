ActiveRecord::Schema.define(version: 20140116060807) do

  create_table "games", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "board"
  end

  create_table "page_views", force: true do |t|
    t.text     "referer"
    t.string   "session"
    t.string   "ip_address"
    t.string   "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitors", force: true do |t|
    t.string   "ip_address"
    t.integer  "page_visits"
    t.datetime "last_visit"
    t.boolean  "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
