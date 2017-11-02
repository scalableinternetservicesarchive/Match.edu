Rails.application.routes.draw do
  get 'students/new'

  #get 'professor/new'
  #post 'professor/create',  to: 'professor#create'
  resources :professor
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'professor#index'
  resources :students
end
