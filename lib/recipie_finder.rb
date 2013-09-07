require 'json'

class RecipieFinder
  def search item
    recipies.keys.select { |name| name.downcase.include? item.downcase }
  end

  def ingredients item
    Recipie.new(recipies[item][0]["recipe"]).as_rows
  end

  private

  def recipies
    @recipies ||= JSON.parse IO.read("recipies.json")
  end
end
