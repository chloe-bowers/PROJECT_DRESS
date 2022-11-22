class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    if @offer.save
      redirect_to @offer, notice: "Offer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def edit
    #  authorize @offer
  end

  def destroy
    @offer.destroy
    redirect_to offer_path, status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :price_per_day, :condition, :size, :description, :photo)
  end
end
