class AddOpponentScoreSumToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :opponent_score_sum, :integer, default: 0
  end
end
