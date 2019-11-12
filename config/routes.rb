Rails.application.routes.draw do

  # Platforms resource
  get '/platforms/:id', to: 'platforms#show'
  get 'platforms/', to: 'platforms#list'
  post 'platforms/', to: 'platforms#create'
  put 'platforms/:id', to: 'platforms#update'
  delete 'platforms/:id', to: 'platforms#delete'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
