class Array
  def after
    yield if self.any?
  end
end

class Enumerator
  def after
    yield if self.any?
  end

  def if_empty
    yield unless self.any?
  end
end

class CommandLine
  def prompt prompt = "", options = []
    puts prompt

    options.each_with_index { |option, i| puts "#{i}) #{option}" }.after do
      print "\n> "
      gets.chomp
    end
  end
end

class CraftyInterface
  OPTIONS = { '0' => :quit }

  def initialize
    @crafty = Crafty.new
    @table = CraftingTable.new
    @command_line = CommandLine.new
  end

  def start
    display_welcome_message
    choose_options
  end

  private

  def display_welcome_message
    @command_line.prompt "Welcome to Crafty!"
  end

  def choose_options option=''
    until option == :quit
      prompt = "Enter the name of the item you wish to craft"
      chosen = @command_line.prompt prompt, ['Quit']
      option = OPTIONS[chosen]

      unless option == :quit
        found = @crafty.search chosen
        index = @command_line.prompt 'Which item?', found

        @command_line.prompt @table.generate(@crafty.materials(found[index.to_i]))
      end
    end
  end
end
