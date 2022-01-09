require './character.rb'
require './brave.rb'
require './monster.rb'
require './games_controller.rb'

games_controller = GamesController.new

brave = Brave.new(name: "テリー", hp: 500, offense: 200, defense: 100)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

games_controller.battle(brave: brave, monster: monster)
