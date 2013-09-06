class CraftyInterface
  def initialize
    @recipies = RecipieFinder.new
    @table = CraftingTable.new
    @command_line = CommandLine.new
  end

  def start
    @command_line.display "Welcome to Crafty!"
    display_crafting_table recipie_for(item(to_craft))
  end

  private

  def to_craft
    @command_line.prompt "\nEnter the name of the item you wish to craft"
  end

  def item term
    items = @recipies.search term
    index = @command_line.prompt("\nWhich item?", items).to_i
    items[index]
  end

  def recipie_for craftable
    @table.generate @recipies.ingredients(craftable)
  end

  def display_crafting_table recipie
    @command_line.display recipie
  end
end
