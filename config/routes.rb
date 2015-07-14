RailsBlog::Application.routes.draw do

  get '/', to: 'welcome#index', as: 'welcome'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :sessions, only: [:create]
  resources :users
  resources :tags
  
  resources :posts do 
    resources :comments
  end

end
