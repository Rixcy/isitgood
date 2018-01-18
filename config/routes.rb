Rails.application.routes.draw do
  resources :movies

  root to: 'static_pages#index'
end
