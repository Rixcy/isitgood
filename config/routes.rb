Rails.application.routes.draw do
  devise_for :users
  resources :movies

  authenticated :user do
    root 'movies#index', as: :authenticated_root
  end

  get 'home', to: 'static_pages#index'
  root 'static_pages#index'
end
