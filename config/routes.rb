Rails.application.routes.draw do
  get "home/top", to: "home#top"

  get "rooms/search", to: "rooms#search"
  resources :rooms
  
  get "reservations/confirm", to: "reservations#confirm"
  resources :reservations

  get "users/account", to: "users#account"
  get "users/profile", to: "users#profile"
  resources :users, only: [:update]
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    # ワンクリックでログアウトする仕様
    get "/users/sign_out", to: "devise/sessions#destroy"
  end    

end