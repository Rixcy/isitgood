Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register',
      edit: 'settings',
    },
    controllers: {
      registrations: 'users/registrations'
    }

  resources :movies

  authenticated :user do
    root 'movies#index', as: :authenticated_root
  end

  get 'home', to: 'static_pages#index'
  root 'static_pages#index'

  namespace :admin do
    resources :users
  end
end
