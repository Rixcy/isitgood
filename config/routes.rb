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

  resource :rating, only: :index

  authenticated :user do
    root 'ratings#index', as: :authenticated_root
  end

  get 'home', to: 'static_pages#index'
  root 'static_pages#index'

  namespace :admin do
    resources :users
    resources :categories
  end
end
