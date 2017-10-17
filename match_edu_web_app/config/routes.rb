Rails.application.routes.draw do
  get 'professor/new'
  post 'professor/create',  to: 'professor#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'professor#index'
end
