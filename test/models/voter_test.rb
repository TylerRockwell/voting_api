require 'test_helper'

class VoterTest < ActiveSupport::TestCase
  test "voters must have names" do
    stan = Voter.new(party: "Pirate")

    refute stan.save
    stan.name = "Stan"
    assert stan.save
  end

  test "voters must have a party" do
    stan = Voter.new(name: "Stan")

    refute stan.save
    stan.party = "Pirate"
    assert stan.save
  end

  test "voters only get one vote" do

  end
end
