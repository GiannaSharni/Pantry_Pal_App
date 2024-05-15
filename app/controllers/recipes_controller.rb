class RecipesController < ApplicationController
  def index
    if params[:search].present?
      @recipes= Recipe.find_by(search_by_ingredients: params[:query])
    else
      flash[:alert] = "No results found"
    end
  end

  def show
    @recipes = Recipe.find(params[:recipe_id])
  end
end
