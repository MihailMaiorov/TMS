Rails.application.routes.draw do
  resources :comments, except: :destroy

  get '/jokes/categories', to: 'jokes#categories'

  get '/jokes/random', to: 'jokes#random'

  get '/jokes/search', to: 'jokes#search'

  root 'pages#index'

  resources :books, only: :index
end
