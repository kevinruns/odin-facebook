class RemoveLikedtextForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :likes, column: :likedtext_id
  end
end
