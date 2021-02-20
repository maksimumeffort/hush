Rails.application.routes.draw do
  devise_for :users

  resources :tours
  resources :activities, only: [:new, :create, :edit]
  resources :locations, only: [:new, :create, :edit, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
