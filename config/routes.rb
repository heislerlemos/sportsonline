Rails.application.routes.draw do
#  get "links", to: "homes#index"
  get "links", to: "home#index"
  post "links", to: "home#create"
  devise_for :users
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end




