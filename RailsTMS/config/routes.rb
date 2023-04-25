require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :books

  devise_for :users

  resource :currency_pairs, only: %i[show] do
    get :convert
  end

  root 'books#index'
end
