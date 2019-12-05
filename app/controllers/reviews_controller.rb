class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = Cocktail.find(params[:cocktail_id])
    if @review.save
      redirect_to cocktail_path(@review.cocktail)
    else
      render :new
    end
  end


    private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
