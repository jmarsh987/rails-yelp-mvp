class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end



  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
  else
    render :new
  end
end

  # PATCH/PUT /reviews/1 or /reviews/1.json

  # DELETE /reviews/1 or /reviews/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :content)
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
