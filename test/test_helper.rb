require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  module SignInHelper
    def sign_in_as(user)
      post user_session_path,params: { :user => {
                                          :email => user.email, 
                                          :password => Devise::Encryptor.digest(User, user.password)}
      }
    end
  end
  
  class ActionDispatch::IntegrationTest
    include SignInHelper
  end
  # Add more helper methods to be used by all tests here...
end
