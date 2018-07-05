Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  namespace :client do
    get '/products' => 'products#index'
    post '/products' => 'products#create'
    get '/products/new' => 'products#new'
    get '/products/:id' => 'products#show'
    get '/products/:id' => 'prodcts#edit'
  end
end
