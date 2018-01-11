Rails.application.routes.draw do
  devise_for :users
  resources :instructors do
  	resources :reviews
  end
  root 'instructors#index'
end
