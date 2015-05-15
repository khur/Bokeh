class AddCriteriaToContests < ActiveRecord::Migration
  def change
    add_column :contests, :criteria, :text
  end
end
