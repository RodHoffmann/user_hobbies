Rails.application.routes.draw do
  devise_for :users do
    get 'login', to: 'devise/sessions#new'
    # root 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :dashboards, only: [:show]
  root to: 'dashboards#show'
end
