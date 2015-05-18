class AddLossTotalToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :loss_total, :integer, default: 0
  end
end
