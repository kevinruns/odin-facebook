class Friend < ApplicationRecord

  belongs_to :requester, class_name: "User"
  belongs_to :invited, class_name: "User"

  scope :accepted, -> { where(status: 1) }
  scope :pending, -> { where(status: 0) }

  enum status: {
    pending: 0,
    accepted: 1
  }

  validates :status, uniqueness: {scope: [:requester_id, :invited_id]}

  def self.friend_list(user)
    friend_1_ids = Friend.accepted.where(invited_id: user).pluck(:requester_id)
    friend_2_ids = Friend.accepted.where(requester_id: user).pluck(:invited_id)
    @friend_ids = friend_1_ids + friend_2_ids
  end

end
