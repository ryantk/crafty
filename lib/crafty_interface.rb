class CraftyInterface
  def initialize
    @recipes = RecipeFinder.new
    @table = CraftingTable.new
    @command_line = CommandLine.new
  end

  def start
    @command_line.display "Welcome to Crafty!"
    display_crafting_table recipe_for(item(to_craft))
  end

  private

  def to_craft
    @command_line.prompt "\nEnter the name of the item you wish to craft"
  end

  def item term
    items = @recipes.search term
    index = @command_line.prompt("\nWhich item?", items).to_i
    items[index]
  end

  def recipe_for craftable
    @table.generate @recipes.ingredients(craftable)
  end

  def display_crafting_table recipe
    @command_line.display recipe
  end
end
