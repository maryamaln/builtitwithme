require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get register" do
    get '/register'
    assert_response :success
  end

  test "should get contact_us" do
    get '/contact_us'
    assert_response :success
  end

  test "should not get all_users" do
    get '/all_users'
    assert_response :redirect
  end

  test "should not get logout" do
    get '/logout'
    assert_response :redirect
  end
end
