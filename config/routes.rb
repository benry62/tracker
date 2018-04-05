Rails.application.routes.draw do

  resources :users
  resources :class_groups
  root 'tests#index'

  resources :questions
  resources :tests
  resources :papers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
