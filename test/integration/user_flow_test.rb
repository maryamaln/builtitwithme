require 'test_helper'
 
class UserFlowTest < ActionDispatch::IntegrationTest
  test "can create a user" do
    get "/register"
    assert_response :success
    post "/users",
    params: { user: { first_name: "youth", last_name: "festival",user_name: "youth_festival",email:"youth@festival.com",address:"Dubai",password: "82922286" } }
  	assert_response :redirect
  	follow_redirect!
  	assert_response :success
  end

  test "login user" do
    get "/register"
    assert_response :success
    post "/users",
    params: { user: { first_name: "youth", last_name: "festival",user_name: "youth_festival",email:"youth@festival.com",address:"Dubai",password: "82922286" } }
  	assert_response :redirect
  	follow_redirect!
  	assert_response :success
  	get "/users"
  	assert_response :success
  	post "/login",
    params: { user: { email:"youth@festival.com",password: "82922286" } }
    assert_response :redirect
  	follow_redirect!
  	assert_response :success
  end

  test "logout user" do
    get "/register"
    assert_response :success
    post "/users",
    params: { user: { first_name: "youth", last_name: "festival",user_name: "youth_festival",email:"youth@festival.com",address:"Dubai",password: "82922286" } }
  	assert_response :redirect
  	follow_redirect!
  	assert_response :success
  	get "/users"
  	assert_response :success
  	post "/login",
    params: { user: { email:"youth@festival.com",password: "82922286" } }
    assert_response :redirect
  	follow_redirect!
  	assert_response :success
  	get "/logout"
  	assert_response :redirect
  	follow_redirect!
  	assert_response :success
  end

  test "contact us page" do
  	get "/contact_us"
  	assert_response :success
  end
end