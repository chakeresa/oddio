Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/register', to: 'app_auths#new'
  resources :app_auths, only: [:create]
<<<<<<< HEAD
  resources :users, only: [:new, :create]
=======
  resources :users, only: [:new, :create, :show]
>>>>>>> 75b46aee16f8431b4b28d085c1b4ff06652e9983

  get '/auth/google_oauth2/callback', to: 'google_auths#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :landmarks, only: [:index, :show]

  resources :recordings, only: [:index]

  namespace :user do
<<<<<<< HEAD
    resources :votes, only: [:create]
  end
  
=======
    resources :landmarks, only: [:show] do
      resources :recordings, only: [:new, :create]
    end
  end

>>>>>>> 75b46aee16f8431b4b28d085c1b4ff06652e9983
  namespace :api do
    namespace :v1 do
      resources :landmarks, only: [:index, :show]
    end
  end
end
