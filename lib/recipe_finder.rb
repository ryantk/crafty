require 'json'

class RecipeFinder
  def search item
    recipes.keys.select { |name| name.downcase.include? item.downcase }
  end

  def ingredients item
    Recipe.new(recipes[item][0]["recipe"]).as_rows
  end

  private

  def recipes
    @recipes ||= JSON.parse recipes_file
  end

  def recipes_file
    Dir.chdir(File.dirname(__FILE__))
    IO.read("recipes.json")
  end
end
