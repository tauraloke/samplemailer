Rails.application.routes.draw do
  root 'letter#index'

  post '/', to: 'letter#create'
  patch '/', to: 'letter#create'
  get '/success', to: 'letter#success', as: :success

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  
end
