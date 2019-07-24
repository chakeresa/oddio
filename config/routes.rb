Rails.application.routes.draw do

  root to: 'welcome#index'

  # Registration & Login
  get '/register', to: 'app_auths#new'
  resources :app_auths, only: [:create]
  resources :users, only: [:new, :create, :show]
  get '/auth/google_oauth2/callback', to: 'google_auths#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # Landmarks
  resources :landmarks, only: [:index, :show]

  namespace :user do
    resources :landmarks, only: [:show] do
      resources :recordings, only: [:new, :create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :landmarks, only: [:index, :show]
    end
  end

  # Recordings
  resources :recordings, only: [:index]

  # Tours
  resources :tours, only: [:index, :show]
end
