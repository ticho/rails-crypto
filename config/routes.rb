Rails.application.routes.draw do
  post '/', to: 'home#display', as: 'home_display'
  post '/refresh', to: 'home#refresh', as: 'home_refresh'
  root 'home#index'
end
