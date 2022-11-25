class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :offers, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :picture
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
