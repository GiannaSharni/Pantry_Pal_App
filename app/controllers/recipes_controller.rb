class RecipesController < ApplicationController
  def index
    # @ingredients = Ingredient.new
    @recipe = Recipe.new
    if params[:search].present?
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.all
      flash[:alert] = "No results found"
    end
  end

  def show
    @recipes = Recipe.find(params[:recipe_id])
  end
end
