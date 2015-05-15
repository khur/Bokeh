class AddImageToPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :url
    add_column :photos, :image, :string
  end
end
