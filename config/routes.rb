Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations',:omniauth_callbacks => "omniauth_callbacks" }

  get 'static_pages/home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  #get  '/contact', to: 'static_pages#contact'
  post '/contact', to: 'contacts#create'
  get '/contact', to: 'contacts#new'

  get 'reports', to: 'reports#index'
  get 'reports/new', to: 'reports#new'
  get 'reports/busqueda', to: 'reports#busqueda'
  get 'reports/mis_reportes', to: 'reports#mis_reportes'
  
  get 'statistics', to: 'statistics#index'
  
  get 'bicicletas/mis_bicicletas', to: "bycicle#index"
  get 'bicicletas/mis_bicicletas/:id', to: "bycicle#edit"
  get 'bicicletas/new', to: "bycicle#new"
  post 'bicicletas/create',  to: "bycicle#create"
  post 'bicicletas/update',  to: "bycicle#update"
  post 'bicicletas/del/:id', to: "bycicle#del"
  get 'bicicletas/bici_robada', to: 'bycicle#bici_robada'
  get 'bicicletas/robada', to: 'bycicle#robada'
  
  resources :users
  resources :users
  resources :reports do
    resources :comments
  end  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
