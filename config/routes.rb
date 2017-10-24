Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations',:omniauth_callbacks => "omniauth_callbacks" }, class_name: 'FormUser'

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
  
  devise_scope :user do
    get '/users/auth/:provider/upgrade', to: 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', to: 'omniauth_callbacks#setup'
  end
  resources :users
  resources :reports do
    resources :comments
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  def upgrade
    scope = nil
    if params[:provider] == "google_oauth2"
      scope = "email,profile,offline,https://www.googleapis.com/auth/admin.directory.user"
    end

    redirect_to user_omniauth_upgrade_path( params[:provider] ), flash: { scope: scope }
  end
  def setup
    request.env['omniauth.strategy'].options['scope'] = flash[:scope] || request.env['omniauth.strategy'].options['scope']
    render :text => "Setup complete.", :status => 404
  end
end
