
ActiveRecord::Schema[7.0].define(version: 2022_11_08_114137) do
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "residence"
    t.index ["email"], name: "index_friends_on_email", unique: true
  end

end
