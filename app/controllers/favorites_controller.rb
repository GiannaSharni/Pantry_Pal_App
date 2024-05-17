# app/controllers/favorites_controller.rb
class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = Recipe.where(id: current_user.favorites.pluck(:recipe_id))
  end

  def add_favorite
    @recipe = Recipe.find(params[:recipe_id])
    current_user.favorites.create(recipe: @recipe)
    redirect_to recipe_path(@recipe), notice: 'Recipe added to favorites.'
  end

  def remove_favorite
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe: @recipe)
    favorite.destroy if favorite
    redirect_to recipe_path(@recipe), notice: 'Recipe removed from favorites.'
  end
end


 # def index
 #   @favorites = Recipe.where(id: current_user.favorites.pluck(:recipe_id))
 # end

 # def add_favorite
 #   @recipe = Recipe.find(params[:recipe_id])
 #   current_user.favorite(@recipe)
 #   @favorite.save
 #   redirect_to recipe_path(@recipe)
  #end
#end
