Rails.application.routes.draw do
  get '/jokes', to: 'jokes#random'

  get '/jokes/chuck', to: 'jokes#chuck'

  root 'pages#index'
end
