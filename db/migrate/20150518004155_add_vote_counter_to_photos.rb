class AddVoteCounterToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :vote_counter, :integer, default: 1
  end
end
