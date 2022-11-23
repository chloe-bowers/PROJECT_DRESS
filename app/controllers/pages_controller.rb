class PagesController < ApplicationController
  def home
  end

  def dashboard
    @bookings = policy_scope(Booking)
  end
end
