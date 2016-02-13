require 'test_helper'

class TrainingsControllerTest < ActionController::TestCase
  test "should get train" do
    get :train
    assert_response :success
  end

end
