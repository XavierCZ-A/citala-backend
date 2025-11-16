Rails.application.routes.draw do
  namespace :api do
    resources :bookings
    resources :event_types, except: [ :show ], path: "event"
    resources :availabilities, except: [ :show ]
    namespace :authentication, path: "" do
      resources :sessions, only: [ :create ], path: "login"
      resources :users, path: "register", only: [ :create ]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
