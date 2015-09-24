require 'test_helper'

class VotesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "voter can vote" do
    v = Voter.first
    post :create, candidate_id: Candidate.first.id, voter_id: v.id, access_token: v.access_token
    assert v.reload.vote
  end

  test "voters can only vote once" do
    v = Voter.first
    post :create, candidate_id: Candidate.first.id, voter_id: v.id, access_token: v.access_token
    assert v.reload.vote

    post :create, candidate_id: 3, voter_id: v.id, access_token: v.access_token
    refute v.reload.vote.candidate_id == 3
  end

  test "voters must provide their access_token" do
    v = Voter.first
    post :create, candidate_id: Candidate.first.id, voter_id: v.id
    refute v.vote

    post :create, candidate_id: Candidate.first.id, voter_id: v.id, access_token: v.access_token
    assert v.reload.vote
  end

  test "votes can be deleted by the voter" do
    v = Voter.first
    post :create, candidate_id: Candidate.first.id, voter_id: v.id, access_token: v.access_token
    assert v.reload.vote

    delete :destroy, access_token: v.access_token
    refute v.reload.vote
  end

  test "index displays all candidates and their vote count" do
    get :index

    assert response.body.include?("Duck President")
  end

end
