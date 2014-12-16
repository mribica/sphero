Rails.application.routes.draw do
  root 'sphero#index'
  post "sphero/action", to: "sphero#action"
  get "sphero/rainbow", to: "sphero#rainbow"
  get "sphero/crazy", to: "sphero#crazy"
  get "sphero/circle", to: "sphero#circle"
end
