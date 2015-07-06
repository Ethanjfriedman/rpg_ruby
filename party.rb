class Party
  def initialize
    @alive = []
    @dead = []
  end

  def enroll(member)
  end

  def any?
    @alive.any?
    # should return true if the party has surviving members
  end
end

class HeroParty < Party
  def attack(opposing_party)
    # sending message to user, asking which monster to attack
  end
end

class MonsterParty < Part
  def attack(opposing_party)
    # randomly choose a member of the opposing_party and attack it
  end
end
