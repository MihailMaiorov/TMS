Rails.application.routes.draw do
  get '/jokes/categories', to: 'jokes#categories'

  get '/jokes/random', to: 'jokes#random'

  root 'pages#index'
end
