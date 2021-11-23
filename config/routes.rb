Rails.application.routes.draw do
  resources :pins
  resources :destinations
  resources :users
    # get '/users', to: 'user#index'
    # get '/users/:id', to: 'users#show'
    # get '/users/new', to: 'user#new'
    # post '/users', to: 'users#create'
    # get '/users/:id/edit', to: 'user#new'
    # patch '/users/:id', to: 'users#update'
    # delete '/users/:id', to: 'users#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#Rails request/response flow
  #client side sends a request
  #receiving server sends to router
  #router will send to appropriate controller#action
  #controller will interact with model, model with db
  #retrieve data and send that to view