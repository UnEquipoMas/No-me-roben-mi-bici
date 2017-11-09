require 'test_helper'

class RegistrationFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
   # test "Intentando ingresar con datos en blanco" do
   #  get new_user_registration_path
   #  assert_response :success
 
   #  post user_session_path, params: { user: {email: " ", password: " "} }
   #  assert_equal 302, status
   #  follow_redirect!
   #  assert_response :success
   #  end
 
#   test "attempt to register with existing user details" do
#     user = User::Create::Operation::Default.(user: attributes_for(:user)).model
 
#     get "/join"
#     assert_response :success
 
#     post_via_redirect "/join", user: {email: user.email, username: user.username, password: ""}
#     assert_equal "/join", path
#     assert_response 400
#   end
 
#   test "register as new user" do
#     get "/join"
#     assert_response :success
 
#     assert_difference "ActionMailer::Base.deliveries.size" do
#       post_via_redirect "/join", user: {email: "name@domain.com", username: "name", password: "password"}
#     end
 
#     assert_equal "/login", path
#     assert_response :success
#   end
  
  
end
