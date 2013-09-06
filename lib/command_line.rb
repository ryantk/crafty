class CommandLine
  def display string
    puts string
  end

  def prompt prompt = "", options = []
    display prompt
    print_options options
    get_response
  end

  private

  def print_options options
    options.each_with_index { |option, i| puts "#{i}) #{option}" }
  end

  def get_response
    print "> "
    gets.chomp
  end
end
