class AddWinTotalToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :win_total, :integer, default: 0
  end
end
