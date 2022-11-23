class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :title, :size, presence: true
  validates :title, uniqueness: true
end
