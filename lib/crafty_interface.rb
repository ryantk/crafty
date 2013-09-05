class CraftyInterface
  OPTIONS = { 'c' => :craft, 'q' => :quit  }

  def initialize crafty = Crafty.new, table = CraftingTable.new
    @crafty = crafty
    @table = table
  end

  def start
    display_welcome_message
    choose_options
  end

  private

  def display_welcome_message
    puts "Welcome to Crafty!"
  end

  def choose_options
    until @option == :quit
      puts
      puts
      puts "Enter the name of the item you wish to craft"
      puts "q) Quit"
      puts
      print "> "

      response = gets.chomp.downcase
      @option = OPTIONS[response]

      unless @option == :quit
        items = @crafty.search response

        puts
        if items.any?
          items.each_with_index do |item, index|
            puts "#{index} -> #{item}"
          end

          print "> "

          puts @table.generate(@crafty.materials(items[gets.chomp.to_i]))
        else
          puts "No results for #{response}!"
        end
      end
    end
  end
end
