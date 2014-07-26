class AddLanguageField < ActiveRecord::Migration
  def self.up
  	add_column :maps, :language, :string
  end

  def self.down
  	remove_column :maps, :language
  end
end
