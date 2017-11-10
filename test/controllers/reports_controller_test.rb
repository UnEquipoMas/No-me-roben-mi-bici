require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "should not redirect" do
    sign_in_as(users(:one))
    get reports_path
    assert_not_equal reports_path , path
  end
end

