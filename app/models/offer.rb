class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :title, :size, :price_per_day, presence: true
  validates :title, uniqueness: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: %i[title size condition description],
    associated_against: {
      user: %i[first_name last_name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
