Rails.application.routes.draw do
  resources :landmarks, only: [:index]
end
