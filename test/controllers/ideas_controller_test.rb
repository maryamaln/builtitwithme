require 'test_helper'

class IdeasControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get all_ideas" do
    get '/all_ideas'
    assert_response :success
  end

  test "should not get idea detail" do
    get '/ideas/2'
    assert_response :redirect
  end
end
