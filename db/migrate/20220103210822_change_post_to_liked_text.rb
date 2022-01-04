class ChangePostToLikedText < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :post_id, :likedtext_id
  end
end
