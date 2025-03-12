Rails.application.routes.draw do
  get "carts/show"
  get "carts/add_post"
  get "carts/remove_post"
  get "admin/index"


  resources :carts do
    post 'add_post', on: :collection  # Creates add_post_carts_path
    delete 'remove_post/:post_id', to: 'carts#remove_post', as: 'remove_post' # Creates remove_post_cart_path
  end
  
  

  namespace :admin do
    get '/', to: "admin#index", as: :dashboard
    patch "toggle_admin/:id", to: "admin#toggle_admin", as: :toggle_admin
    delete "delete_user/:id", to: "admin#delete_user", as: :delete_user
  end
  
  
  devise_for :users
  resources :posts do 
    resources :comments, only: [:new, :create, :index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "posts#index"
end
