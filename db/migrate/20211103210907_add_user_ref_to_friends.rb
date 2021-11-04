class AddUserRefToFriends < ActiveRecord::Migration[6.1]
  def change
    add_reference :friends, :requester, null: false, index: true
    add_foreign_key :friends, :users, column: :requester_id

  end
end
