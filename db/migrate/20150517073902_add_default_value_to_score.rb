class AddDefaultValueToScore < ActiveRecord::Migration
  def change
    change_column :photos, :score, :integer, default: 1400
  end
end
