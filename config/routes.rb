Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artists
      resources :favorites, only: [:destroy]
      resources :users, only: [:create, :update, :destroy]
      post'/login', to: 'auth#create'
      get'/profile', to: 'users#profile'

    end
  end
end
