class ReviewsController < ApplicationController
  def new
    # @review = Review.new
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @recipe = Recipe.find_by_id(params[:recipe_id])
    if @review.save!
      redirect_to recipe_path(@recipe), notice: 'Review was successfully created!'
    else
      # render :new
      redirect_to new_recipe_review_path(@recipe), notice: 'Review was not created. Try again'
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :comment, :raiting)
  end
end
