Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users ,only: [:index, :show] do
    resources :posts,only: [:index, :new, :create, :show]
    # resources :comments.only: [:create]
  end

  resources :posts do
    resources :comments, only: [:create]
  end
end
