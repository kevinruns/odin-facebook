class ChangePostToBody < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :post, :body
  end
end
