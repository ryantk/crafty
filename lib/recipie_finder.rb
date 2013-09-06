require 'nokogiri'
require 'open-uri'

class RecipieFinder
  def search item
    results = []

    results.tap do
      CRAFTABLES.each do |craftable|
        results << craftable if craftable.downcase.include? item.downcase
      end
    end
  end

  def ingredients item
    recipie = Recipie.new

    grid(item).each do |space|
      recipie.add_to_table index_of(space), space.attr('title')
    end

    recipie.as_rows
  end

  private

  def grid item
    page.xpath("//div[div[@title=\"#{item}\"]]").css('div.mc_craft_box')
  end

  def index_of space
    space.attr('id').match(/mc_craft_box_([1-9])/)[1].to_i
  end

  def page
    @page ||= Nokogiri::HTML open('http://minecraft.ign.com/crafting-recipes')
  end

  CRAFTABLES = [
    "Boots (Diamond)",
    "Boots (Gold)",
    "Boots (Iron)",
    "Boots (Leather)",
    "Chestplate (Diamond)",
    "Chestplate (Gold)",
    "Chestplate (Iron)",
    "Chestplate (Leather)",
    "Helmet (Diamond)",
    "Helmet (Gold)",
    "Helmet (Iron)",
    "Helmet (Leather)",
    "Leggings (Diamond)",
    "Leggings (Gold)",
    "Leggings (Iron)",
    "Leggings (Leather)",
    "Brick Block",
    "Clay Block",
    "Clay Brick",
    "Diamond Block",
    "Glass",
    "Glowstone Block",
    "Gold Block",
    "Iron Block",
    "Lapis Lazuli Block",
    "Melon Block",
    "Sandstone Block",
    "Snow Block",
    "Stone Block",
    "Stone Brick Block",
    "TNT",
    "Wooden Planks",
    "Bed",
    "Bookshelf",
    "Door (Iron)",
    "Door (Wood)",
    "Fence (Nether Brick)",
    "Fence (Wood)",
    "Fence Gate",
    "Glass Pane",
    "Iron Bars",
    "Jack-O-Lantern",
    "Jukebox",
    "Ladder",
    "Note Block",
    "Painting",
    "Sign",
    "Slab (Brick)",
    "Slab (Cobbletone)",
    "Slab (Sandstone)",
    "Slab (Stone Brick)",
    "Slab (Stone)",
    "Slab (Wooden)",
    "Stairs (Brick)",
    "Stairs (Nether Brick)",
    "Stairs (Stone Brick)",
    "Stairs (Stone)",
    "Stairs (Wood)",
    "Trapdoor",
    "Bone Meal",
    "Dye (Cactus Green)",
    "Dye (Cyan)",
    "Dye (Dandelion Yellow)",
    "Dye (Gray)",
    "Dye (Light Blue)",
    "Dye (Light Gray)",
    "Dye (Light Gray)",
    "Dye (Lime)",
    "Dye (Magenta)",
    "Dye (Orange)",
    "Dye (Pink)",
    "Dye (Purple)",
    "Dye (Rose Red)",
    "Bowl",
    "Bread",
    "Cake",
    "Cooked Chicken",
    "Cooked Fish",
    "Cooked Porkchop",
    "Cookie",
    "Golden Apple",
    "Melon Seeds",
    "Mushroom Stew",
    "Pumpkin Seeds",
    "Steak",
    "Sugar",
    "Coal / Charcoal",
    "Gold Ingot",
    "Gold Ingot",
    "Iron Ingot",
    "Blaze Powder",
    "Book",
    "Brewing Stand",
    "Cauldron",
    "Chest",
    "Crafting Table",
    "Dispenser",
    "Enchantment Table",
    "Eye Of Ender",
    "Fermented Spider Eye",
    "Furnace",
    "Glass Bottle",
    "Magma Cream",
    "Paper",
    "Stick",
    "Torch",
    "Lever",
    "Piston",
    "Pressure Plate (Stone)",
    "Pressure Plate (Wood)",
    "Redstone Repeater",
    "Sticky Piston",
    "Stone Button",
    "Torch (Redstone)",
    "Axe (Diamond)",
    "Axe (Gold)",
    "Axe (Iron)",
    "Axe (Stone)",
    "Axe (Wood)",
    "Bucket",
    "Clock",
    "Compass",
    "Fishing Rod",
    "Flint and Steel",
    "Hoe (Diamond)",
    "Hoe (Gold)",
    "Hoe (Iron)",
    "Hoe (Stone)",
    "Hoe (Wood)",
    "Map",
    "Pickaxe (Diamond)",
    "Pickaxe (Gold)",
    "Pickaxe (Iron)",
    "Pickaxe (Stone)",
    "Pickaxe (Wood)",
    "Shears",
    "Shovel (Diamond)",
    "Shovel (Gold)",
    "Shovel (Iron)",
    "Shovel (Stone)",
    "Shovel (Wood)",
    "Boat",
    "Detector Rail",
    "Minecart",
    "Minecart (Powered)",
    "Minecart (Storage)",
    "Powered Rail",
    "Rail",
    "Arrows",
    "Bow",
    "Sword (Diamond)",
    "Sword (Gold)",
    "Sword (Iron)",
    "Sword (Stone)",
    "Sword (Wood)",
    "Wool",
    "Wool (Black)",
    "Wool (Blue)",
    "Wool (Brown)",
    "Wool (Cyan)",
    "Wool (Gray)",
    "Wool (Green)",
    "Wool (Light Blue)",
    "Wool (Light Gray)",
    "Wool (Lime)",
    "Wool (Magenta)",
    "Wool (Orange)",
    "Wool (Pink)",
    "Wool (Purple)",
    "Wool (Red)",
    "Wool (Yellow)"
  ]
end
