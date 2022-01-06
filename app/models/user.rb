class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, :first_name, :family_name, presence: true
    
  def full_name
    "#{first_name} #{family_name}"
  end

  has_many :requests, class_name: "Friend", foreign_key: "requester_id"
  has_many :invites, class_name: "Friend", foreign_key: "invited_id"

  has_many :posts, foreign_key: :author_id, dependent: :destroy

  has_many :likes, foreign_key: :liker_id, dependent: :destroy
  has_many :posts, through: :likes

  has_many :comments, foreign_key: :commenter_id, dependent: :destroy
  has_many :posts, through: :comments

  has_one_attached :avatar

  def friends
    Friend.friend_list(self)
  end

end
