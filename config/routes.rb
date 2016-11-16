Rails.application.routes.draw do
  get 'planes/new'
  get 'planes/show'
  get 'static/search'
  get '/about' => 'static#about'
  get 'plans/index'

  devise_for :users
  resources :plans
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#home'
end
