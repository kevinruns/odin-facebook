class RemoveLikedTextId < ActiveRecord::Migration[6.1]
  def change

    remove_column :likes, :likedtext_id_id

  end
end
