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

end
