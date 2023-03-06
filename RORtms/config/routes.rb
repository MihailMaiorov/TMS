Rails.application.routes.draw do
  get '/jokes/categories', to: 'jokes#categories'

  get '/jokes/random', to: 'jokes#random'

  get '/jokes/search', to: 'jokes#search'

  root 'pages#index'
end
