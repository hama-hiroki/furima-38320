Rails.application.routes.draw do
  
  devise_for :users
  get '/items/new', to: 'items#new'
  root to: 'items#index' 
  
  
end
