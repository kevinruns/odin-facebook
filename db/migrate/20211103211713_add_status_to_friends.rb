class AddStatusToFriends < ActiveRecord::Migration[6.1]
  def change
    add_column :friends, :status, :integer, default: 0
  end
end
