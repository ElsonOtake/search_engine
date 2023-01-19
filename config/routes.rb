Rails.application.routes.draw do
  resources :people, only: %i[new create] do
    resources :articles, only: %i[index show]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
