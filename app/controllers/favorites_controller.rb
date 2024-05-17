class FavoritesController < ApplicationController
  def index
    @favorites = Recipe.where(id: current_user.favorites.pluck(:recipe_id))
  end

  def add_favorite
    @recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(@recipe)
    @favorite.save
    redirect_to recipe_path(@recipe)
  end
end
