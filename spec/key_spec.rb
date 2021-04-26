require 'rspec'
require './lib/crypt'
require './lib/key'
require 'date'

RSpec.describe Key do
  context 'initialization' do
    it 'exists' do
      key = Key.new

      expect(key).to be_an_instance_of(Key)
    end

    it 'creates a range of numbers' do
      key = Key.new

      expect(key.range).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'num_array creates a random set of numbers at the length of five' do
      key = Key.new

      expect(key.num_array.length).to eq(5)
      expect(key.num_array.class).to eq(Array)
    end

    it 'key_into_integer turns a string into an integer' do
      key = Key.new

      expect(key.key_into_integer("51387")).to eq([5, 1, 3, 8 , 7])
    end

    it 'can separate a number into five sets of two' do
      key = Key.new

      expect(key.final_key_creator([5, 1, 3, 8 , 7])).to eq([51, 13, 38, 87])
    end
  end

  context 'offset creation' do
    it 'can give an offset' do
      key = Key.new

      expect(key.create_offset('042421')).to eq(["1", "2", "4", "1"])
    end

    it 'can calculate a final shift' do

      allow(Date).to receive(:today).and_return(Date.new(2021, 04, 24))

      key = Key.new
      encrypted_key = key.final_key_creator([5, 1, 3, 8, 7])

      expect(key.final_shift(encrypted_key, (Date.today))).to eq([2, 20, 13, 10])
    end
  end
end
