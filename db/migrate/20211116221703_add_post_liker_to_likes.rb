class AddPostLikerToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :post, null: false, index: true
    add_foreign_key :likes, :posts, column: :post_id

    add_reference :likes, :liker, null: false, index: true
    add_foreign_key :likes, :users, column: :liker_id
  end
end
