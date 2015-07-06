class Party
  attr_accessor :alive

  def initialize
    @alive = []
    @dead = []
  end

  def enroll(member)
    @alive.push(member)
    #add a member to the party
  end

  def any?
    @alive.any?
    # should return true if the party has surviving members
  end

  def none?
    !any? #should return true if the party has no surviving members
  end
end

class HeroParty < Party
  def attack(opposing_party)
    # sending message to user, asking which monster to attack
  end
end

class MonsterParty < Party
  def attack(opposing_party)
    # randomly choose a member of the opposing_party and attack it
  end
end
