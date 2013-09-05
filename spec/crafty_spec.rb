require 'spec_helper'

describe Crafty do
  subject(:crafty) { Crafty.new }

  it { should respond_to :search }

  describe '#search' do
    describe 'will look up the input from a hash table' do
      context 'valid crafting item' do
        it 'will return similar crafting items' do
          expect(crafty.search 'Boots').to include('Boots (Leather)')
        end
      end

      context 'invalid crafting item' do
        it 'will return a list of possible craftable items' do

        end
      end
    end
  end
end
