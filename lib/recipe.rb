class Recipe
  ROWS = { 1 => 0..2,
           2 => 3..5,
           3 => 6..8 }

  def initialize grid = nil
    @grid = grid || ['','','','','','','','','']
  end

  def as_rows
    [@grid[ROWS[1]], @grid[ROWS[2]], @grid[ROWS[3]]]
  end
end
