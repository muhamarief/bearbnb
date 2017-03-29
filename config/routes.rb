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
  # get "/users/:user_id/listings/:id", to: "listings#edit"
  # patch "/users/:user_id/listings/:id", to: "listings#update"

  resources :listings do
    resources :reservations, only: [:new, :create, :show]
  end

  # get "/listings/:listing_id/reservations/new", to: "reservations#new"
  # post "/listings/:listing_id/reservations/create", to: "reservations#create", as:'listing_reservations'
  # get "/listings/:listing_id/reservations/:id" => "reservations#show"
  # resources :listings do
  #   resources :reservations
  # end



end
