class OffersController < ApplicationController
  def index
    if params[:user].present? || params[:query].present? || params[:size].present?
      @offers = policy_scope(Offer).global_search(params[:user]) if params[:user].present?

      if @offers.nil?
        @offers = policy_scope(Offer).global_search(params[:query]) if params[:query].present?
      elsif params[:query].present?
        @offers = @offers.global_search(params[:query])
      end

      if @offers.nil?
        @offers = policy_scope(Offer).global_search(params[:size]) if params[:size].present?
      else
        @offers = @offers.global_search(params[:size]) if params[:size].present?
      end
    # if params[:user].present? || params[:query].present? || params[:size].present?
      # @offers_user =  policy_scope(Offer).global_search(params[:user]) if params[:user].present?
      # @offers_query = policy_scope(Offer).global_search(params[:query]) if params[:query].present?
      # @offers_size = policy_scope(Offer).global_search(params[:size]) if params[:size].present?
      # @offers = [@offers_query, @offers_size, @offers_user].reject { |offer| offer.nil?}.first
    else
      @offers = policy_scope(Offer).order('created_at DESC')
    end
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
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    authorize @offer
    if @offer.update(offer_params)
      redirect_to @offer, notice: "Dress was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to offers_path, status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :price_per_day, :condition, :size, :description, photos: [])
  end
end
