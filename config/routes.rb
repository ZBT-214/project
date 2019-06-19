Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"

  resources :versions
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users
  resources :apps
  resources :apps do
    resources :versions
  end
  resources :apps do
    resources :users
  end
  root 'apps#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
