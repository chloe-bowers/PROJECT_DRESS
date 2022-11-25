class BookingsController < ApplicationController

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
    @booking.total_price = @offer.price_per_day * (@booking.end_date.to_date - @booking.start_date.to_date)
    # save it!
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    # @booking.update(booking_params)
    if params[:status] == "1"
      # @booking.accepted!
      @booking.update!(status: 1)
      flash[:success] = "Booking was accepted"
      redirect_to dashboard_path
    elsif params[:status] == "2"
      # @booking.declined!
      @booking.update!(status: 2)
      flash[:error] = "Booking was declined"
      redirect_to dashboard_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
