require 'test_helper'

class VotersControllerTest < ActionController::TestCase

  test "show should authenticate users" do
    get :show, access_token: voters(:two).access_token
    assert_response :success

    assert response.body.include?("Jimmy")
    refute response.body.include?("Stan")
  end

  test "create makes a new user" do
    start = Voter.count
    post :create, name: "Mike", party: "Democrat"

    assert start < Voter.count
  end

  test "can update a user" do
    v = Voter.first
    patch :update, name: "Jimmy", party: "Elven", access_token: v.access_token

    assert_equal "Jimmy", v.reload.name
    assert_equal "Elven", v.reload.party
  end

end
