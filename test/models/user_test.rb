require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "User count in fixtures" do
    assert_equal 0, User.count
  end

  test "User should be created without  email" do
  	user = User.new(first_name: 'Sammy', last_name: 'Sams', address: 'lahore',user_name:'ume') 
    assert_not user.save
  end

  test "User should be created without  first_name" do
  	user = User.new(email: 'ume19@hotmail.com', last_name: 'Sams', address: 'lahore',user_name:'ume') 
    assert_not user.save
  end

  test "User should be created without  last_name" do
  	user = User.new(email: 'ume19@hotmail.com', first_name: 'Sams', address: 'lahore',user_name:'ume') 
    assert_not user.save
  end

  test "User should be created without  address" do
  	user = User.new(first_name: 'Sammy',email: 'ume19@hotmail.com', first_name: 'Sams', user_name:'ume') 
    assert_not user.save
  end

  test "User should be created without  user_name" do
  	user = User.new(first_name: 'Sammy',email: 'ume19@hotmail.com', first_name: 'Sams', address:'Pak') 
    assert_not user.save
  end
  
end
