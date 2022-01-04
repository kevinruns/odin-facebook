class RemoveLikedTextRef < ActiveRecord::Migration[6.1]
  def change

    remove_reference :likes, :liked_text_id foreign_key: true

    remove_index :likes, name: "index_likes_on_likedtext_id"

  end
end
