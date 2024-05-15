class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @recent_recipes = ['Lasagna', 'White Chocolate Big Cake']
  end
end
