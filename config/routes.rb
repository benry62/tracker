Rails.application.routes.draw do

  root 'tests#index'


  resources :results
  resources :students
  resources :users
  resources :class_groups
  resources :questions
  resources :tests
  resources :papers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
