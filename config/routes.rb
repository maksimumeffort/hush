Rails.application.routes.draw do
  get 'locations/new'
  get 'locations/edit'
  get 'activities/new'
  get 'activities/edit'
  devise_for :users

  resources :tours
  resources :activities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
