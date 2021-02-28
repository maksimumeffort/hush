Rails.application.routes.draw do

  get 'tour_activity/edit'

  devise_for :users
  root to: 'pages#home'

  resources :tours do
    member do
      patch :publish
    end
  end

  resources :tours do
    resources :activities do
    end
  end



  resources :activities, only: [:new, :create, :edit]
  resources :locations, only: [:new, :create, :edit, :update, :show]

  get '/dashboard', to: 'pages#dashboard'

  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

