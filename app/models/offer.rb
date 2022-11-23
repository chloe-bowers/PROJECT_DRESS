class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :title, :size, :price_per_day, presence: true
  validates :title, uniqueness: true
end
