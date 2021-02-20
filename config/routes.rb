Rails.application.routes.draw do
  get 'activities/new'
  get 'activities/edit'
  devise_for :users

  resources :tours
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
