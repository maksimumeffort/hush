Rails.application.routes.draw do
  get 'tour_activity/edit'
  devise_for :users

  resources :tours
  resources :activities, only: [:new, :create, :edit]
  resources :locations, only: [:new, :create, :edit, :update, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
