class Comment < ApplicationRecord

  belongs_to :post, foreign_key: :post_id
  belongs_to :commenter, class_name: "User", foreign_key: :commenter_id

end
