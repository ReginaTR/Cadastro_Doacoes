Rails.application.routes.draw do
  resources :institutions
	get 'about', to: 'page#about'
  if Rails.env.development? || Rails.env.test?
    mount Railsui::Engine, at: "/railsui"
  end

  # Inherits from Railsui::PageController#index
  # To overide, add your own page#index view or change to a new root
  # Visit the start page for Rails UI any time at /railsui/start
  root to: "products#index"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index]
  resources :institutions, only: [:index]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end