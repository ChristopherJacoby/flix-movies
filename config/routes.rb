Rails.application.routes.draw do
  root "movies#index"
  resources :movies
  resources :reviews
  resources :users
  get "signup" => "users#new"
end
