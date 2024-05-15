require 'uri'
require 'net/http'

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :reviews

  # include PgSearch::Model
  # pg_search_scope :search_by_title,
  #   against: [ :title ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  def self.search
    url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=apples%2Cflour%2Csugar&number=5&ignorePantry=true&ranking=1")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV["RAPID_API"]
    # request["Content-Type"] = 'charset=utf-8'
    # 'application/json'
    # 'charset=utf-8'
    request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

    response = http.request(request)
    results = JSON.parse(response.read_body.force_encoding("UTF-8"))
    p results
  end
end
