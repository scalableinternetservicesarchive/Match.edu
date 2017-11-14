Rails.application.routes.draw do
  get 'hello', to: 'application#hello'
  get 'sessions/new'
  post 'students/interest',  to: 'students#interest'
  post 'professor/interest',  to: 'professor#interest'
  #get 'professor/new'
  #post 'professor/create',  to: 'professor#create'
  resources :professor
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'professor#index'
  resources :students
  get 'recommendations', to: 'students#recommendations'
  get 'admin', to: 'professor#admin'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
