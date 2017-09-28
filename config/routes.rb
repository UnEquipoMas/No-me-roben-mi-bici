Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations',:omniauth_callbacks => "users/omniauth_callbacks" }
  
  get 'static_pages/home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  #get  '/contact', to: 'static_pages#contact'
  post '/contact', to: 'contacts#create'
  get '/contact', to: 'contacts#new'

  get 'reports', to: 'reports#index'
  get 'reports/new', to: 'reports#new'


  resources :users
  resources :reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
