require 'spec_helper'

describe RecipeFinder do
  it { should respond_to :search }
  it { should respond_to :ingredients }

  let (:rf) { RecipeFinder.new }
  let (:recipe) { Recipe.new }
  let (:ingredient_rows) { [ingredients[0..2],
                            ingredients[3..5],
                            ingredients[6..8]] }
  let (:ingredients) { ["Iron Ingot",
                        "Stick",
                        "Iron Ingot",
                        "Iron Ingot",
                        "Redstone Torch",
                        "Iron Ingot",
                        "Iron Ingot",
                        "Stick",
                        "Iron Ingot"] }

  before do
    recipe.stub(:as_rows).and_return(ingredient_rows)

    rf.stub(:recipes).and_return({ "Activator Rail" =>
                                   [{"output"=>6,
                                     "recipe"=> ingredients,
                                     "shapeless"=>0}] })
  end

  describe '#search' do
    context 'when given an item to search for' do
      let(:results) { rf.search "Rail" }

      it 'returns similar results / matches' do
        expect(results).to eq(["Activator Rail"])
      end
    end
  end

  describe '#ingredients' do
    let(:results) { rf.ingredients "Activator Rail" }

    context 'when given a true craftable item' do
      it 'returns an array of rows of ingredients' do
        expect(results).to eq(ingredient_rows)
      end
    end
  end
end
