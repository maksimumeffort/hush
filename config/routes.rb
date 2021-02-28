Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'tour_activity/edit'

  devise_for :users
  root to: 'pages#home'

  resources :tours
  resources :activities, only: [:new, :create, :edit]
  resources :locations, only: [:new, :create, :edit, :update, :show]
  resources :bookings, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
