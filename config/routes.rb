Rails.application.routes.draw do
  devise_for :users

  root to: "recipes#index"

  resources :recipes do
    resources :reviews, only: [:new, :create]

    resources :posts
    post '/posts/:id/submit_review', to: 'posts#submit_review', as: 'submit_review'

    post "add_favorite", to: "recipes#add_favorite", as: :add_favorite
  end

  get 'favorites', to: 'favorites#index'
  post 'favorites/:recipe_id', to: 'favorites#add_favorite', as: 'add_favorite'
  delete 'favorites/:recipe_id', to: 'favorites#remove_favorite', as: 'remove_favorite'
  post '/recipes/:id/submit_review', to: 'recipes#submit_review', as: 'submit_review'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
