require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
ENV['RAILS_ADMIN_THEME'] = 'rollincode'



module HelloApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.exceptions_app = self.routes

    #config.time_zone = 'Bogota'
    #config.active_record.default_timezone = :local # Or :utc
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    ActionMailer::Base.smtp_settings={
      :address =>"smtp.gmail.com",
     :domain  => "gmail.com",
     :port => 587,
     :authentication  => "login",
     :enable_starttls_auto => true,
     :user_name => "L4NC3L0G4NW0LFST41N@gmail.com",
     :password => "nomerobenmibici"
    }
  end
end
