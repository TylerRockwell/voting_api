require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "votes belong to voters" do
    stan = Voter.new(name: "Stan", party: "Pirate")
    vote = Vote.new

    vote.voter = stan
    assert_equal stan, vote.voter
  end

  test "votes also belong to candidates" do
    duck = Candidate.create(name: "Duck")
    vote = Vote.create
    voter = Voter.create(name: "Stan", party: "Pirate")

    voter.vote = vote
    assert_equal vote, voter.reload.vote

    vote.candidate = duck
    assert_equal duck, vote.candidate
  end
end
