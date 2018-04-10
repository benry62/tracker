Rails.application.routes.draw do


  #resources :results
  resources :students
  resources :users
  resources :class_groups
  resources :questions
  resources :tests
  resources :papers
  resources :assignments do
    resources :papers
  end

  resources :results do
    collection do
      post :import
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
