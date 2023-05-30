Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :my do
    resources :accommodations, only: %i[index new]
  end

  resources :accommodations, only: %i[index show create]
end
