require_relative 'lib/command_line'
require_relative 'lib/crafty_interface'
require_relative 'lib/recipe'
require_relative 'lib/recipe_finder'
require_relative 'lib/crafting_table'

crafty = CraftyInterface.new
crafty.start
