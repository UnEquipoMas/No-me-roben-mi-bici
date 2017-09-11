Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'

  resources :microposts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  #root 'application#hello'
  root 'static_pages#home'
=======
  resources :contacts, only: [:new , :create ]
  devise_for :users, :controllers => { registrations: 'registrations' }
>>>>>>> origin/SPRINT_REVISION_1
end
