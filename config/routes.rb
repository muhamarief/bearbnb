Rails.application.routes.draw do

  get 'braintree/new'

  root 'welcome#index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # user sessions and clearance
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  #user facebook omniauth and edit
  resources :users, only: [:show, :index]
  get "/auth/:provider/callback", to: "sessions#create_from_omniauth", as:"fb"
  patch "/users/:id", to: "users#edit", as: "edit_user"

  #listings
  resources :users do
    resources :listings, only: [:edit,:update]
  end
  resources :listings, except: [:edit, :update]

  resources :listings do
    resources :reservations, only: [:new, :create, :show, :index]
  end

  resources :reservations do
    resources :braintree, only: :new
  end
  post 'braintree/checkout'

  get '/my_trips', to: "reservations#index", as: "my_reservations"
  get '/users/:user_id/reservations/:id', to: "reservations#show", as: "my_reservation"

  # patch '/reservations/:reservation_id', to: "reservation#update_request"

end
