require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "The /login route opens the login page" do
  	get '/login'
  	assert_response :success
  end

  test "The /logout route opens the logout page" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirect_to '/'
  end

    test "The /register route opens the sign up page" do
  	get '/register'
  	assert_response :redirect
  	assert_redirect_to '/'
  end
end
