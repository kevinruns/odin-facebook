class LikeComment < Like

  belongs_to :liker, class_name: :User, foreign_key: :liker_id
  belongs_to :comment, class_name: :Comment, foreign_key: :likedtext_id

end
