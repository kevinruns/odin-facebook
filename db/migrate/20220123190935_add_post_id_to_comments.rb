class AddPostIdToComments < ActiveRecord::Migration[6.1]
  def change

    add_column :comments, :post_id, :bigint, reference: true, index: true
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type

  end
end
