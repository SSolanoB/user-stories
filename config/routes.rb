Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get '/list', to: 'home#post_listing'
  post '/create', to: 'posts#create'
  post '/createseen', to: 'seens#create'
  
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users do
    resources :posts
  end
  resources :seens
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
