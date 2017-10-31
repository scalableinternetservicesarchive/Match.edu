Rails.application.routes.draw do
  resources :professor
  resources :student
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'professor#index'
end
