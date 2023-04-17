require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resource :currency_pairs, only: %i[show] do
    get :convert
  end
end
