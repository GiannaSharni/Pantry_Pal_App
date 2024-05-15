class FavoritesController < ApplicationController
  def index
    @favorites = Recipe.where(id: current_user.favorites.pluck(:recipe_id))
  end
end
