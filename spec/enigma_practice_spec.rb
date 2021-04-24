require 'rspec'
require './lib/enigma_practice'

RSpec.describe EnigmaPractice do
  context 'initialization' do
    it 'exists' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice).to be_an_instance_of(EnigmaPractice)
    end
  end

  context 'letter changing with rotate' do
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

  context 'letter changing with ordinals' do
    it 'can change the array into ordinals' do
      enigma_practice = EnigmaPractice.new

      expected = [97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 32]

      expect(enigma_practice.change_array_to_ord).to eq(expected)
    end

    it 'can chanage a single letter to an ordinal' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice.single_letter_ord("a")).to eq(97)
    end

    it 'can change a single letter to a different letter' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice.single_letter_change("a")).to eq("b")
    end
  end
end
