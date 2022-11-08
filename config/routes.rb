Rails.application.routes.draw do

  root to: 'public/homes#top'
  get "home/about" => "homes#about", as: "about"


  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  resources :customers

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  resources :admins



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
