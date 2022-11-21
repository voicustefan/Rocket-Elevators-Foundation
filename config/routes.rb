Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "home#index"
  resources :quotes
  get 'home/corporate'
  get 'home/residential'
  get 'home/form'
  get 'home/login'
  get 'home/map'
  get 'home/admin'
  get 'home/barchart'
  get 'home/polly'
  get 'home/admin'
  get 'home/barchart'
  resources :maps
  resources :places
  get "/index/logout"
  post '/leads/create'
  get 'meme/index'
  get 'upload/index'
  get 'dropbox/upload'
  # get 'dropbox/index'
  get 'dropbox/auth'
  get 'dropbox/auth_callback'
  get 'dropbox/upload_dropbox'
  get 'dropbox/authorize'
  

  post "/graphql", to: "graphql#execute"
  
  post '/leads/create'
  
  get 'meme/index'
  get 'upload/index'
  get 'dropbox/upload'
  get 'dropbox/index'
  get 'dropbox/auth'
  get 'dropbox/auth_callback'
  get 'dropbox/upload_dropbox'
  get 'dropbox/authorize'
  
  post 'dropbox/upload'
  #===============================================================================
  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'
  #===============================================================================
  resources :leads
  
  resources :customers
  resources :employees
  resources :buildings_details
  resources :columns
  resources :buildings
  resources :batteries
  resources :elevators  
  resources :addresses
  resources :leads
  resources :quotes
  resources :polly
  resources :lists, only: [:index, :show, :create, :update, :destroy] do
    resources :items, except: [:new]

  post '/request_quote', to: 'quotes#create'
  post '/form_submit', to: 'lead#create'
  end
  # get 'quotes/requestQuote'
  # post '/request_quote', to: 'quotes#create'
  # post '/form_submit', to: 'lead#create'
  # get 'slack/webhook'
  # post 'slack/webhook', to: 'slack#webhook'


#   mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
#     root "home#index"
#     get 'home/corporate'
#     get 'home/residential'
#     get 'home/form'
#     get 'home/login'
#     get 'home/admin'
#     get 'home/barchart'
#     get 'home/places'
#     get 'home/map'
#   resources :quotes
#   devise_for :users

  
#   post '/request_quote', to: 'quotes#create'
#   post '/form_submit', to: 'lead#create'
#   # For details on the DSL this file, see http://guides.rubyonrails.org/routing.html


  
  post '/request_quote', to: 'quotes#create'
  post '/form_submit', to: 'lead#create'
  # For details on the DSL this file, see http://guides.rubyonrails.org/routing.html
end

