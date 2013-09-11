class CraftingTable
  def initialize
    @console_width = 60
  end

  def generate materials
    materials.map { |row| format(row) }.join(divider)
  end

  private

  def format row
    row.map { |material| (material || "").center(width) }.join('|')
  end

  def width
    (@console_width-3) / 3
  end

  def divider
    ["\n", '-' * @console_width, "\n"].join
  end
end
