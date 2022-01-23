class AddPostIdFromComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :post, index: true, foreign_key: true
  end
end
