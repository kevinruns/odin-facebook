class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  before_validation :set_username

  validates :email, presence: true
    
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

  has_many :notifications, foreign_key: :recipient_id

  def friends
    Friend.friend_list(self)
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end


  private

    def set_username
      self.user_name = self.email.split(/@/).first
    end


end
