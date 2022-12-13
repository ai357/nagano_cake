Rails.application.routes.draw do



  scope module: :public do

    get "/about" => "homes#about", as: "about"
    get "/customers/my_page" => "customers#show", as: "customer"
    get "/customers/information/edit" => "customers#edit"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    get "/customers/withdraw" => "customers#withdraw"
    patch "/customers/information" => "customers#update"
    #get "/cart_items" => "cart_items#show"
    #get "/addresses" => "addresses#index"
    #get "/orders/new" => "orders#new"
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    #post "/orders" => "orders#create"
    #get "/orders" => "orders#index"
    #get "/orders/:id" => "orders#show", as: "order"
    # resource :customers
    resources :items
    resources :cart_items
    delete "/cart_items" => "cart_items#destroy_all", as: "cart_destroy_all"
    resources :addresses
    resources :orders
    root to: 'homes#top'

  end


  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do
  resources :items
  resources :customers
  resources :genres
  resources :orders
  root to: 'homes#top'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
