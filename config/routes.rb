Rails.application.routes.draw do
  root 'sessions#new'
  
  namespace :api do
    namespace :v1 do
      resources :people, only: %i[index show] do
        resources :analytics, only: %i[index show create]
      end
    end
  end
  
  resources :sessions, only: %i[new create destroy]
  
  resources :people, only: %i[new create] do
    resources :articles, only: %i[index show]
    resources :analytics, only: %i[index show]
  end
end
