class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to @offer, notice: "Offer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def edit
    # authorize @offer
    @offer = Offer.find(params[:id])
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path, status: :see_other
    authorize @offer # Add this line
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :price_per_day, :condition, :size, :description, :photo)
  end
end
