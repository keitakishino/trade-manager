Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :cards, only: %i[index]
  resources :products, only: %i[index edit update create new destroy]
end
