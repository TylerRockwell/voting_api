require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  test "candidates can get votes" do
    duck = Candidate.new(name: "Duck")
    vote = Vote.new

    duck.votes << vote
    assert duck.votes.include?(vote)
  end

  test "candidates must have a name" do
    duck = Candidate.new
    refute duck.save

    duck.name = "Duck"
    assert duck.save
  end
end
