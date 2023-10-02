Rails.application.routes.draw do
  devise_for :users do
    get 'login', to: 'devise/sessions#new'
    # root 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'dashboard', to: 'dashboards#show'
  resources :dashboards, only: %i[edit update]
  root to: 'dashboards#show'
end
