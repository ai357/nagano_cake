Rails.application.routes.draw do

  root to: 'public/homes#top'
  get "home/about" => "homes#about", as: "about"


  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  resource :customers

  get "admin/homes/top" => "admin/homes#top"
  get "admin/genres/index" => "admin/genres#index"


  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
  resources :items
  resources :customers
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
