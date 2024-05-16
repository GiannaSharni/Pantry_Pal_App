class ReviewsController < ApplicationController
  def new
    # @review = Review.new
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.new
  end

  def create
    @review = Review.new(:recipe_id)
    if @review.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end
end
