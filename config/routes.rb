Rails.application.routes.draw do
  get 'sessions/new'
  resources :teachers
  resources :students
  resources :subjects
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signin', to: 'sessions#new'
  post '/signin',   to: 'sessions#create'
  delete '/signin',  to: 'sessions#destroy'
end
