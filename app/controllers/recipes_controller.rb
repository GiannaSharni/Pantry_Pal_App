class RecipesController < ApplicationController
  before_action :authenticate_user!, except: :index
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
