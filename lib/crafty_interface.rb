class CommandLine
  def display string
    puts string
  end

  def print_options options
    options.each_with_index { |option, i| puts "#{i}) #{option}" }
  end

  def get_response
    print "> "
    gets.chomp
  end

  def prompt prompt = "", options = []
    display prompt
    print_options options
    get_response
  end
end

class CraftyInterface
  def initialize
    @crafty = Crafty.new
    @table = CraftingTable.new
    @command_line = CommandLine.new
  end

  def start
    @command_line.display "Welcome to Crafty!"
    display_crafting_table recipie_for(item(to_craft))
  end

  private

  def to_craft
    @command_line.prompt "Enter the name of the item you wish to craft"
  end

  def item term
    items = @crafty.search term
    index = @command_line.prompt('Which item?', items).to_i
    items[index]
  end

  def recipie_for craftable
    @table.generate @crafty.materials(craftable)
  end

  def display_crafting_table recipie
    @command_line.display recipie
  end
end
