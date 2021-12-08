class AddPostAuthorToComments < ActiveRecord::Migration[6.1]
  def change

    add_reference :comments, :commenter, references: :users, index: true
    add_foreign_key :comments, :users, column: :commenter_id

    add_reference :comments, :post, index: true
    add_foreign_key :comments, :posts, column: :post_id

  end
end
