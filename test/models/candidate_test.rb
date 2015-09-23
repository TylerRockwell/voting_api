require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  test "candidates can get votes" do
    duck = Candidate.create!(name: "Duck")
    vote = Vote.create!

    duck.votes << vote
    assert duck.reload.votes.include?(vote)
  end

  test "candidates must have a name" do
    duck = Candidate.new
    refute duck.save

    duck.name = "Duck"
    assert duck.save
  end
end
