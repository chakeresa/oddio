Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/register', to: 'app_auths#new'
  resources :app_auths, only: [:create]

  resources :users, only: [:new, :create, :show]


  get '/auth/google_oauth2/callback', to: 'google_auths#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :landmarks, only: [:index, :show]

  resources :recordings, only: [:index]

  namespace :user do
    get '/dashboard', to: 'dashboard#index'
    delete '/dashboard/:id', to: 'recordings#destroy', as: :delete_recording
    resources :votes, only: [:create]
    resources :landmarks, only: [:show] do
      resources :recordings, only: [:new, :create]
    end
  end

  namespace :admin do
    get '/users/:user_id', to: 'users#show'
    delete '/destroy/:id', to: 'recordings#destroy', as: :delete_recording
  end

  namespace :api do
    namespace :v1 do
      resources :landmarks, only: [:index, :show]
    end
  end
end
