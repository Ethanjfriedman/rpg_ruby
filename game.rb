require 'pry'

require_relative 'hero'
require_relative 'monster'
require_relative 'party'


class Game

  attr_reader :heroes, :myParty, :monsters

  def initialize
    @heroes = [
      { "name": "Artemis",
        "hp": 20,
        weapon: Weapon.new(name: "Longsword", damage: 3)
      },
      {
        name: "Hulk Hogan",
        hp: 30
      },
      {
        name: "Mr. Hat",
        hp: 10,
        weapon: Weapon.new(name: "Flying hat", damage: 5)
      },
      {
        name: "Matthew Short",
        hp: 20,
        weapon: Weapon.new(name: "MacBook Air", damage: 3)
      }
    ]

    @monsters = [
      {
        name: "Goblin, father of 7",
        hp: 9,
        weapon: Weapon.new({
          name: "his wife's rusty last kitchen knife",
          damage: 1,
          price: 1
        }),
        xp: 2,
        gold: 1
      },
      {
        name: "Mitt Romney",
        hp: 22,
        weapon: Weapon.new({
          name: "fat stacks",
          damage: 2,
          price: 50
          }),
        xp: 4,
        gold: 99
      },
      {
        name: "Bowser",
        hp: 30,
        weapon: Weapon.new({
          name: "Fireballs",
          damage: 10,
          price: 0
          }),
        xp: 10,
        gold: 25
      },
      {
        name: "Antonin Scalia",
        hp: 10,
        weapon: Weapon.new({
          name: "Withering dissents",
          damage: 12,
          price: 10
          }),
        xp: 22,
        gold: 22
      }
    ]

    @myParty = []
  end

  def enlist_heroes
    puts <<-ENROLL_MESSAGE
    Welcome to Forest of Doom!

    You need to begin by choosing your party of two heroes.
    Currently drinking in the tavern are:
    ENROLL_MESSAGE

    display_heroes_for_hire

    @myParty = HeroParty.new()

      while @myParty.alive.length < 2 do
        puts "Enter the number of the hero you wish to choose."
        newHero = gets.chomp.to_i
        myParty.enroll(Hero.new(heroes[newHero]))
        heroes.slice!(newHero)
        puts "Remaining heroes:"
        display_heroes_for_hire
      end

      play
  end

  def display_heroes_for_hire
    hero_counter = 0
    while hero_counter < @heroes.length do
      currentHero = @heroes[hero_counter]
      puts " #{hero_counter}. Name: #{currentHero[:name]}, HP: #{currentHero[:hp]}, weapon: #{currentHero[:weapon]}"
      hero_counter += 1
    end
  end

  def enter_forest
    puts "You're in the forest! OF DOOM"
    #generate a MonsterParty
    #make them fight
    #if at least one hero is alive, loot the monsters and return to town_message
    #if the monsters win, display losing message
  end

  def enter_shop
    puts "Welcome to Sears"
  end

  def town_message
    puts <<-PLAY_MESSAGE
    Your heroes are ready for action,
    should they...
    1. Enter the forest?
    2. Go shopping for wares?
    PLAY_MESSAGE
  end

  def get_location
    resp = gets.chomp

    if resp == "1"
      return :forest
    else
      return :shop
    end
  end

  def play
    town_message
    case get_location
    when :forest
      enter_forest
    when :shop
      enter_shop
    end
  end
end
#
# artemis = Hero.new({
#   name: "Artemis",
#   hp: 20,
#   weapon: Weapon.new({
#     name: "longbow",
#     damage: 6,
#     price: 25
#   })
# })
#
# goblin = Monster.new({
#   name: "Goblin, father of 7",
#   hp: 9,
#   weapon: Weapon.new({
#     name: "his wife's rusty last kitchen knife",
#     damage: 1,
#     price: 1
#   }),
#   xp: 2,
#   gold: 1
# })
#
# current_fighters = [artemis, goblin]
# attacker = current_fighters.shift
# attackee = current_fighters.shift
#
# while attackee.is_alive?
#   attacker.attack(attackee)
#
#   puts "#{attacker} attacks #{attackee} with his #{attacker.weapon} for #{attacker.weapon.damage}.  #{attackee} now has #{attackee.current_hp} HP left."
#
#   attacker, attackee = attackee, attacker unless attackee.is_dead?
# end
#
# puts "#{attackee} is now dead..."

myGame = Game.new

myGame.enlist_heroes

Pry.start(binding)
