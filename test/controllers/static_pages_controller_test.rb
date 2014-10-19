require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get code_of_ethics" do
    get :code_of_ethics
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

end
