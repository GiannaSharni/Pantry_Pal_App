# app/controllers/favorites_controller.rb
class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.map do |favorite|
      Recipe.search_recipe(favorite.recipe_id)
    end
  end

  def add_favorite
    @favorite = current_user.favorites.create!(recipe_id: params[:recipe_id])
    redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe added to favorites.'
  end

  def remove_favorite
    favorite = current_user.favorites.find_by(recipe_id: params[:recipe_id])
    favorite.destroy
    redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe removed from favorites.'
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
