require 'spec_helper'

describe CraftingTable do
  subject(:ct) { CraftingTable.new }

  it { should respond_to :generate }

  describe '#generate' do
    context 'when given a recipe' do
      it 'should return a table containing the recipes formatted' do
        chest = [['Wooden Planks', 'Wooden Planks', 'Wooden Planks'],
                 ['Wooden Planks', '',              'Wooden Planks'],
                 ['Wooden Planks', 'Wooden Planks', 'Wooden Planks']]

        result = ct.generate chest
        expect(result).to match(/Wooden Planks/)
        expect(result).to match(/-------------/)
      end
    end
  end
end
