Rails.application.routes.draw do
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'
  get '/search' => 'products#search'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/orders/new' => 'orders#new'
  get '/orders/:id' => 'orders#show'
  post '/orders' => 'orders#create'

  get '/carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'
  patch '/carted_products/:id' => 'carted_products#update'
  delete '/carted_products/:id' => 'carted_products#destroy'
end
