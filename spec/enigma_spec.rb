require 'rspec'
require 'date'
require './lib/key'
require './lib/enigma'

RSpec.describe Enigma do
  context 'initialization' do
    it 'exists' do
      enigma = Enigma.new

      expect(enigma).to be_an_instance_of(Enigma)
    end

    it 'can create an alphabet' do
      enigma = Enigma.new

      actual = expected =["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

      expect(enigma.alphabet).to eq(actual)
    end
  end

  context 'encrypt' do
    xit 'can encrypt a word' do
      enigma = Enigma.new

      actual = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(actual)
    end
  end
end
