class RecipesController < ApplicationController
  def index
    @ingredients = Recipe.search
    # access info in api and add these key words together
    @recipe = Recipe.new
    if params[:search].present?
      @recipes = Recipe.search(params[:search])
      # redirect_to recipes_path(@recipes) fix this one with new page
    else
      @recipes = Recipe.all
      flash[:alert] = "No results found"
    end
  end

  def show
    @recipes = Recipe.find(params[:recipe_id])
  end
end
