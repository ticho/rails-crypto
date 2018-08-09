Rails.application.routes.draw do
  post '/', to: 'home#display', as: 'home_display'
  root 'home#index'
end
