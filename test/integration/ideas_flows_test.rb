require 'test_helper'
 
class IdeasFlowTest < ActionDispatch::IntegrationTest
	test "show all ideas" do
    	get "/all_ideas"
    	assert_response :success
  	end
  	test "show ideas by type" do
    	get "/all_ideas/newest"
    	assert_response :success
  	end
end