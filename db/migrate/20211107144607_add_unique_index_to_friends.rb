class AddUniqueIndexToFriends < ActiveRecord::Migration[6.1]
  def change
    add_index :friends, [:requester_id, :invited_id, :status], unique: true
  end
end
