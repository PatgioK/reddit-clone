Rails.application.routes.draw do
  devise_for :accounts

  get "u/:username" => "public#profile", as: :profile

  #resources will create all default routes
  resources :communities do
    resources :posts
  end
  
  resources :subscriptions
  resources :comments, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "public#index"
end
