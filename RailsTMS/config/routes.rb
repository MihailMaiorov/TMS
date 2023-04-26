require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  resource :currency_pairs, only: %i[show] do
    get :convert
  end

  resources :books

  root 'books#index'
end
