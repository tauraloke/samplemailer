require 'test_helper'

class LetterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get send" do
    get :send
    assert_response :success
  end

end
