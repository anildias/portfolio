class AddNewTagsToPhotos < ActiveRecord::Migration
  def self.up
  	add_column :photos, :new_tags, :string
  end

  def self.down
  	remove_column :photos, :new_tags
  end
end
