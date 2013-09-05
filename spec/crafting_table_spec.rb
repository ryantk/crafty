require 'spec_helper'

describe CraftingTable do
  subject(:ct) { CraftingTable.new }

  it { should respond_to :generate }

  describe '#generate' do
    context 'when given array of crafting materials' do
      it 'should display them in a grid' do
        bed = [['',            '',            ''],
               ['Wool',        'Wool',        'Wool'],
               ['Wood Planks', 'Wood Planks', 'Wood Planks']]

        expect(ct.generate(bed)).to match(/Wool/)
        expect(ct.generate(bed)).to match(/Wood Planks/)
      end
    end
  end
end
