class IngredientsController < ApplicationController
  def new
    @ingredients = Ingredients.new
  end
end
