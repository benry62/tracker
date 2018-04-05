Rails.application.routes.draw do

  root 'tests#home'

  resources :questions
  resources :tests
  resources :papers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
