Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :my do
    resources :accommodations, only: %i[index new edit]
    resources :bookings, only: %i[show index create destroy edit update]
    # modifs
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
    # modifs
  end

  resources :accommodations, only: %i[index show create update destroy] do
    namespace :trip do
      resources :bookings, only: %i[new]
    end
  end

  # resources :chatrooms, only: :show do
  #   resources :messages, only: :create
  # end
end
