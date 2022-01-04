class Comment < ApplicationRecord

  belongs_to :post, foreign_key: :post_id
  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :like_comments, foreign_key: :likedtext_id, dependent: :destroy
  has_many :likers, through: :likeposts

end
