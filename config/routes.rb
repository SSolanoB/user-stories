Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  post '/create', to: 'posts#create'
  post '/createseen', to: 'seens#create'
  
  devise_for :users
  resources :users do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
