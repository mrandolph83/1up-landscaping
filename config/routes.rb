Rails.application.routes.draw do
  root :to => 'sessions#welcome'
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  resources :reviews

  resources :jobs do
    resources :reviews, only: [:new, :index]
    end
  namespace :admin do 
    resources :jobs, only: [:index, :show]
    resources :users, only: [:index]
    resources :reviews, only: [:index]
  end 

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

 
  resources :employees
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
