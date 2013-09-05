class CraftingTable
  def initialize
    @console_width = `tput cols`.to_i
  end

  def generate materials
    table = ""

    table.tap do
      materials.each_with_index do |row, index|
        table << format(row)

        unless index == materials.size-1
          table << divider
        end
      end
    end
  end

  private

  def spacing m
    length = m.collect { |material| material.length }.inject(:+)

    ((@console_width - length) / 3).floor.to_i
  end

  def format materials
    space = spacing materials
    formatted = ""

    formatted.tap do
      materials.each do |material|
        formatted << " " * (space/2)
        formatted << material
        formatted << " " * (space/2)
      end
    end
  end

  def divider
    '-' * @console_width
  end
end
