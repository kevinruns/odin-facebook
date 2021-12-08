class Post < ApplicationRecord

  belongs_to :author, class_name: :User, foreign_key: :author_id

  has_many :likes, foreign_key: :post_id, dependent: :destroy
  has_many :likers, through: :likes

  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :commenters, through: :comments

  accepts_nested_attributes_for :comments

end
