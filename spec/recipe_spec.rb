require 'spec_helper'

describe Recipe do
  it { should respond_to :as_rows }

  describe '#as_rows' do
    it 'returns its grid as an array of 3 arrays' do
      result = Recipe.new([1, 2, 3, 4, 5, 6, 7, 8, 9]).as_rows
      expect(result[0]).to eq([1, 2, 3])
      expect(result[1]).to eq([4, 5, 6])
      expect(result[2]).to eq([7, 8, 9])
    end
  end
end
