class AddUserIdToContests < ActiveRecord::Migration
  def change
    add_column :contests, :user_id, :integer
  end
end
