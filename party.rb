class Party
  attr_accessor :alive, :dead

  def initialize
    @alive = []
    @dead = []
  end

  def enroll(member) #add a member to the party

    @alive.push(member)
  end

  def any?
    @alive.any? # should return true if the party has surviving members
  end

  def none?
    !any? #should return true if the party has no surviving members
  end

  def cleanup_the_dead #remove dead members from @alive and insert into @dead
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
    # sending message to user, asking which monster each hero should attack
    @alive.each do |hero|
      puts "Choose target for #{hero.name}:"
      opposing_party.alive.each_with_index do |monster, index|
        puts "#{index}. Name: #{monster[:name]}"
        if monster[:current_hp]
          puts "   Current HP: #{monster[:current_hp]}"
        else
          monster[:current_hp] = monster[:max_hp]
          puts "   Current HP: #{monster[:max_hp]}"
        end
        puts "   Weapon: #{monster[:weapon]}"
      end
      target = gets.chomp.to_i
      opposing_party.alive[target][:current_hp] -= hero.weapon.damage
      puts "#{["Pow", "Bam", "Smash"].sample}! #{hero.name} attacks for #{hero.weapon.damage} damage"
      puts " #{opposing_party.alive[target][:name]} now has #{opposing_party.alive[target][:current_hp]} hp"


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
  def attack(opposing_party) # randomly choose a member of the opposing_party and attack it
    opposing_party.cleanup_the_dead

    #if opposing_party.any?
    opposing_party.attack(self)
    #heroes get to attack
    #else
    #display end-of-game message
  end
end
