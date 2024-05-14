class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def add_favorite
    @recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(@recipe)
    @favorite.save
    redirect_to recipe_path(@recipe)
  end
end
