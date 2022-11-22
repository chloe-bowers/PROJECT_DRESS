class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :start_date, :end_date, presence: true

  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }, _prefix: true
end
