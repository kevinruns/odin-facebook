class LikePost < Like

  belongs_to :liker, class_name: :User, foreign_key: :liker_id
  belongs_to :post, class_name: :Post, foreign_key: :likedtext_id

end
