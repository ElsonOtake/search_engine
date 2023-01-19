Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :analytics
    end
  end
  root 'sessions#new'
  resources :sessions, only: %i[new create destroy]
  
  resources :people, only: %i[new create] do
    resources :articles, only: %i[index show]
  end
end
