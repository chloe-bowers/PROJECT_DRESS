Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources :offers do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[] do
    member do
      patch :accept
      patch :decline
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
