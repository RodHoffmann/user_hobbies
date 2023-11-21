Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
    # root 'devise/sessions#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'dashboard', to: 'dashboards#show'
  resources :dashboards, only: %i[edit update]
  get 'dashboard', to: 'dashboards#show'
  root 'dashboards#show'
end
