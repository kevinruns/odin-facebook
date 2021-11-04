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

end
