class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    if params[:query].present?
      @crecipes = Recipe.search_by_title(params[:query])
    end
  end

  def show
    @recipes = Recipe.all
  end
end
