Rails.application.routes.draw do
  #Custom Routes (ALWAYS ABOVE RESOURCES GENERATED ROUTES!)
  root to: 'application#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  
  resources :users
  

  resources :pins, only: [:index, :new, :create] #for anything non-nested
  
  resources :destinations do    #nested routes go in one direction, parent to child
    resources :pins, shallow: true #shallow creates an index, new and create only through destinations
  end

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#Rails request/response flow
  #client side sends a request
  #receiving server sends to router
  #router will send to appropriate controller#action
  #controller will interact with model, model with db
  #retrieve data and send that to view