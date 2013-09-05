require_relative 'lib/crafty'
require_relative 'lib/crafting_table'

crafty = Crafty.new
table  = CraftingTable.new

print table.display crafty.search(ARGV.first)
