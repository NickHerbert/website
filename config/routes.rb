NSite::Application.routes.draw do
  resources :users

  resources :levels do
    resources :galleries do
      resources :artworks
    end
  end

  namespace :admin do
    resources :manage
    get '/admin' => 'manage#index'
    get '/auth/:provider/callback' => 'sessions#create'
    get '/auth/failure' => 'sessions#failure'
    get '/signout' => 'sessions#destroy', :as => :signout
    get '/signin' => 'sessions#new', :as => :signin
  end
  get '/artworks' => 'artworks#index'


  resources :contacts

  resources :projects do
    resources :posts
  end

  get '/landing' => 'landing#index', :as => :home
  root :to => 'landing#index'



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
