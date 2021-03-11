Rails.application.routes.draw do

  devise_for :users
  root to: 'tours#index'

  resources :tours do
    member do
      patch :publish
      patch :clone
      patch :start
    end
  end

  resources :tours do
    resources :activities, only: [ :new, :create, :edit, :update ] do
    end
  end

  resources :tour_activities, only: [ :new, :create, :edit, :update ] do
    member do
      patch :finish
    end
  end

  resources :locations, only: [:new, :create, :edit, :update, :show]

  get '/dashboard', to: 'pages#dashboard'
  

  # resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

