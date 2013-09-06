class CraftingTable
  def initialize
    @console_width = 60
  end

  def generate materials
    materials.map{ |row| format(row) << "\n" }.join(divider << "\n")
  end

  private

  def format materials
    formatted = ""
    materials.each { |material| formatted << center(material) }
    formatted
  end

  def center material
    material.center(@console_width / 3)
  end

  def divider
    '-' * @console_width
  end
end
