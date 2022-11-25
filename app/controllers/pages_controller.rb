class PagesController < ApplicationController
  def home
  end

  def dashboard
    # @bookings = policy_scope(Booking)
    @bookings = Booking.all.order('created_at DESC').select do |booking|
      booking.user == current_user || booking.offer.user == current_user
    end
  end

  def mybookings
    @bookings = Booking.all.order('created_at DESC').select do |booking|
      booking.user == current_user
    end
  end

  def bookingrequests
    @bookings = Booking.all.order('created_at DESC').select do |booking|
      booking.offer.user == current_user
    end
  end
end
