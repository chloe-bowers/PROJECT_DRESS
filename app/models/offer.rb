class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :title, :size, :price_per_day, presence: true
  validates :title, uniqueness: true
end
