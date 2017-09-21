Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  get 'static_pages/home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  #get  '/contact', to: 'static_pages#contact'
  post '/contact', to: 'contacts#create'
  get '/contact', to: 'contacts#new'


  resources :users
  root 'static_pages#home'
end
