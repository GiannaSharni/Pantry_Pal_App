class RecipesController < ApplicationController
  def index
    @ingredients = Recipe.search
    # p ''
    # p @ingredients
    # p params['recipe']['ingredients']
    # p ''
    @recent_recipes = ['Lasagna', 'White Chocolate Big Cake']
    # access info in api and add these key words together
    # @recipe = Recipe.new
    # if params['recipe']['ingredients'].present?
    #   @recipes = Recipe.search(params['recipe']['ingredients'])
    #   # redirect_to recipes_path(@recipes) fix this one with new page
    # else
      @recipes = Recipe.all
      flash[:alert] = "No results found"
    # end
  end

  def show
    @recipes = Recipe.find_by(params[:recipe_id])
  end

  # private

  # def review_params
  #   params.require(:review).permit(:username, :title, :description, :rating)
  # end
end
