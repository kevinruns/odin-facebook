class AddInvitedRefToFriends < ActiveRecord::Migration[6.1]
  def change
    add_reference :friends, :invited, null: false, index: true
    add_foreign_key :friends, :users, column: :invited_id
  end
end
