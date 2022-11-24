class OffersController < ApplicationController
  def index
    if params[:query].present?
      # sql_query = <<~SQL
      #   movies.title @@ :query
      #   OR movies.synopsis @@ :query
      #   OR directors.first_name @@ :query
      #   OR directors.last_name @@ :query
      # SQL
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
      raise
      @offers = Offer.global_search(params[:user]).global_search(params[:size]).global_search(params[:querry])
    else
      @offers = policy_scope(Offer)
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
