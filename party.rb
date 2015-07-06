class Party
  attr_accessor :alive, :dead

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

  def cleanup_the_dead
    the_dead = @alive.select { |fighter| fighter.is_dead? }
    @alive -= the_dead
    @dead += the_dead
  end
end

class HeroParty < Party
    
  def initialize
    @gold = 0
    super
  end

  def attack(opposing_party)
    # sending message to user, asking which monster to attack
    puts "Choose target:"
    opposing_party.alive.each do |monster|
      puts "Name: #{monster[:name]}, HP: #{monster[:current_hp]}"
    end

    # opposing_party.cleanup_the_dead
    # if opposing_party.any?
    #   opposing_party.attack(self)
    else
      #do victory stuff
      #take opposing_party.dead gold
      #distribute the gold to the heroes
      #return you to town_message
    # end
  end
end

class MonsterParty < Party
  def attack(opposing_party)
    # randomly choose a member of the opposing_party and attack it
    opposing_party.cleanup_the_dead

    #if opposing_party.any?
    opposing_party.attack(self)
    #heroes get to attack
    #else
    #display end-of-game message
  end
end
