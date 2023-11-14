Rails.application.routes.draw do
 

  get "links", to: "home#index"
  post "links", to: "home#create"
  put "links/:id", to: 'home#update'
  
  devise_for :users
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end
resources :rooms do
  resources :messages
end

  root 'home#index'
end




