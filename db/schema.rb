# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140726191206) do

# Could not dump table "audits" because of following ArgumentError
#   wrong number of arguments (2 for 4)

# Could not dump table "client_applications" because of following ArgumentError
#   wrong number of arguments (2 for 4)

# Could not dump table "comments" because of following ArgumentError
#   wrong number of arguments (2 for 4)

# Could not dump table "consumer_tokens" because of following ArgumentError
#   wrong number of arguments (2 for 4)

# Could not dump table "gcps" because of following ArgumentError
#   wrong number of arguments (2 for 4)

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "groups_maps" because of following ArgumentError
#   wrong number of arguments (2 for 4)

  create_table "imports", :force => true do |t|
    t.string   "path"
    t.string   "name"
    t.string   "layer_title"
    t.string   "map_title_suffix"
    t.string   "map_description"
    t.string   "map_publisher"
    t.string   "map_author"
    t.string   "state"
    t.integer  "layer_id"
    t.integer  "uploader_user_id"
    t.integer  "user_id"
    t.integer  "file_count"
    t.integer  "imported_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "layers" because of following StandardError
#   Unknown type 'polygon' for column 'bbox_geom'

# Could not dump table "layers_maps" because of following ArgumentError
#   wrong number of arguments (2 for 4)

# Could not dump table "maps" because of following StandardError
#   Unknown type 'polygon' for column 'bbox_geom'

# Could not dump table "memberships" because of following ArgumentError
#   wrong number of arguments (2 for 4)

# Could not dump table "my_maps" because of following ArgumentError
#   wrong number of arguments (2 for 4)

# Could not dump table "oauth_nonces" because of following ArgumentError
#   wrong number of arguments (2 for 4)

# Could not dump table "oauth_tokens" because of following ArgumentError
#   wrong number of arguments (2 for 4)

  create_table "permissions", :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "taggings" because of following ArgumentError
#   wrong number of arguments (2 for 4)

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                 :default => true
    t.integer  "updated_by"
    t.text     "description",                             :default => ""
  end

end
