class BookingsController < ApplicationController
  # before_action :set_booking, only: %i[accept decline]

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    authorize @booking
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
    authorize @booking
    # calculate total price and assign it to booking
    @booking.total_price = @offer.price_per_day * (@booking.end_date - @booking.start_date).to_f
    # save it!
    if @booking.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def accept
    # @booking = Booking.find(params[:id])
    # authorize @booking
    # @booking.accepted!
  # end

  # def decline
    # @booking = Booking.find(params[:id])
    # authorize @booking
    # @booking.declined!
  # end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  # def set_booking
    # @booking = Booking.find(params[:id])
  # end
end
