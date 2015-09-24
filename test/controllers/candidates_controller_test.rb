require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "index should display all candidates" do
    get :index
    assert_response :success

    assert response.body.include?("Duck President")
  end

  test "show should display one candidate" do
    get :show, id:candidates(:duck).id
    assert_response :success

    assert response.body.include?("Duck President")
    refute response.body.include?("Charles")
  end

end
