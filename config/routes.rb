Rails.application.routes.draw do
  root 'sphero#index'
  post "sphero/action", to: "sphero#action"
  get "sphero/rainbow", to: "sphero#rainbow"
end
