require 'test_helper'

class ReportsFlowsTest < ActionDispatch::IntegrationTest


    test "Un usuario no puede ver reportes sin logearse" do
      get reports_path
      assert_equal 302, status
      follow_redirect!
      assert_equal "/users/sign_in", path
      assert_equal 200, status
    end
    
      test "El usuario puede ver reportes despues de logearse" do
        get new_user_session_path
        assert_equal 200, status
        post user_session_path,params: { :user => {
                                            :email => "dahoyosr@gmail.com", 
                                            :password => Devise::Encryptor.digest(User, "92013105083")}
        }
        get reports_path
        assert_not_equal reports_path , path
    end
    
end
