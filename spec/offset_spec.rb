require 'rspec'
require './lib/crypt' 
require './lib/offset'

RSpec.describe Offset do
  context 'initialization' do
    it 'exists' do
      offset = Offset.new

      expect(offset).to be_an_instance_of(Offset)
    end

  end
end
