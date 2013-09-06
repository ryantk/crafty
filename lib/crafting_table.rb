class CraftingTable
  def initialize
    @console_width = 60
  end

  def generate materials
    table = ""

    table.tap do
      materials.each_with_index do |row, index|
        table << format(row) << "\n"

        unless index == materials.size-1
          table << divider << "\n"
        end
      end
    end
  end

  private

  def format materials
    formatted = ""
    formatted.tap do
      materials.each do |material|
        formatted << center(material)
      end
    end
  end

  def center material
    space = ((@console_width / 3) - material.length) / 2
    (" " * space) << material << (" " * space)
  end

  def divider
    '-' * @console_width
  end
end
