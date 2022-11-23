class BookingsController < ApplicationController
  # before_action :set_booking, only: %i[accept decline]

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
  end

  def create
    # find the right offer
    @offer = Offer.find(params[:offer_id])
    # create new booking
    @booking = Booking.new(booking_params)
    # assign booking to right offer
    @booking.offer = @offer
    # assign booking to right user
    @booking.user = current_user
    # calculate total price and assign it to booking
    @booking.total_price = @offer.price_per_day * (@booking.end_date.to_date - @booking.start_date.to_date).to_i
    # save it!
    if @booking.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    if params[:status] == accepted
      @booking.accepted!
      flash[:success] = "Booking was accepted"
      redirect_to bookings_path
    elsif params[:status] == declined
      @booking.declined!
      flash[:error] = "Booking was declined"
      redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  # def set_booking
    # @booking = Booking.find(params[:id])
  # end
end
