class RemoveLikeForeignKeys < ActiveRecord::Migration[6.1]
  def change
    remove_reference :likes, :likedtext_id, index: true, foreign_key: true

    add_reference :post_likes, :likedtext_id, index: true, foreign_key: true
    add_reference :comment_likes, :likedtext_id, index: true, foreign_key: true

  end
end
