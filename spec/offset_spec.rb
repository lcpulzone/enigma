require 'rspec'
require './lib/enigma_practice'
require './lib/offset'

RSpec.describe Offset do
  context 'initialization' do
    it 'exists' do
      offset = Offset.new

      expect(offset).to be_an_instance_of(Offset)
    end

  end
end
