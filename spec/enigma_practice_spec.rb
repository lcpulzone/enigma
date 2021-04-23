require 'rspec'
require './lib/enigma_practice'

RSpec.describe EnigmaPractice do
  context 'initialization' do
    it 'exists' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice).to be_an_instance_of(EnigmaPractice)
    end

    it 'can print the alphabet' do
      enigma_practice = EnigmaPractice.new

      expected =["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(enigma_practice.alphabet).to eq(expected)
    end

    it 'can change a letter to another letter' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice.letter_change("a")).to eq("b")
    end

    it 'can change a couple letters' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice.letter_change("a", 3)).to eq("d")
    end

    it 'can change a couple letters' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice.letter_change("a", 3, 1)).to eq("e")
    end
  end
end
