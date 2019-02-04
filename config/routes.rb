Rails.application.routes.draw do
  devise_for :users
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
  get '/update_marks', to: 'admin/grades#update_marks', as: 'admin_update_marks'
  get '/admin/grades', to: 'admin/grades#index', as: 'admin_grade_index'
  get 'admin/:id/update_marks', to: 'admin/grades#update_marks', as: 'update_marks_admin'
end
