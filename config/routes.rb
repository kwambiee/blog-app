Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Rails.application.routes.draw do
        resources :users ,only[:index, :show] do
            resources :posts,only[:index, :show] do
                resources :comments[:index]
                resources :likes[:index]
            end
        end
    end
end
