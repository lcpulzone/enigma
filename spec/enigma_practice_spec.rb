require 'rspec'
require './lib/enigma_practice'
require './lib/key'

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

  context 'letter changing with .ord and .chr -not dynamic-' do
    it 'can change the array into ordinals' do
      enigma_practice = EnigmaPractice.new

      expected = [97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 32]

      expect(enigma_practice.change_array_to_ord).to eq(expected)
    end

    it 'can change a single letter to an ordinal' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice.single_letter_ord("a")).to eq(97)
    end

    it 'can change a single letter to a different letter' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice.single_letter_change("a")).to eq("b")
    end

    it 'can change a single letter to a different letter with a default rotation value' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice.single_letter_change("a", 2)).to eq("c")
    end
  end

  context 'letter changing with .ord and .chr -dynamic-' do
    it 'can change a word into an ordinal' do
      enigma_practice = EnigmaPractice.new

      expect(enigma_practice.word_to_ord("leigh")).to eq([108, 101, 105, 103, 104])
    end

    it 'can shift the ord number to the right' do
      enigma_practice = EnigmaPractice.new
      expected = enigma_practice.word_to_ord("leigh")

      expect(enigma_practice.shift_right(expected, 3)).to eq([111, 104, 108, 106, 107])
    end

    it 'can change shifted number array to letters' do
      enigma_practice = EnigmaPractice.new
      expected = enigma_practice.word_to_ord("leigh")
      actual = enigma_practice.shift_right(expected, 3)

      expect(enigma_practice.shifted_num_array(actual)).to eq("ohljk")
    end
  end

  context 'decrypt with .ord and .chr -dynamic-' do
    it 'can take an encrypted word and change it to an ordinal array' do
      enigma_practice = EnigmaPractice.new
      expected = enigma_practice.word_to_ord("leigh")
      actual = enigma_practice.shift_right(expected, 3)
      encrypted = enigma_practice.shifted_num_array(actual)

      expect(enigma_practice.encrypted_ord(encrypted)).to eq([111, 104, 108, 106, 107])
    end

    it 'can shift the ord number to the left' do
      enigma_practice = EnigmaPractice.new
      expected = enigma_practice.word_to_ord("leigh")
      actual = enigma_practice.shift_right(expected, 3)
      encrypted = enigma_practice.shifted_num_array(actual)
      encrypted_array = enigma_practice.encrypted_ord(encrypted)

      expect(enigma_practice.shift_left(encrypted_array, 3)).to eq([108, 101, 105, 103, 104])
    end

    it 'can turn ordinal array into a word' do
      enigma_practice = EnigmaPractice.new
      expected = enigma_practice.word_to_ord("leigh")
      actual = enigma_practice.shift_right(expected, 3)
      encrypted = enigma_practice.shifted_num_array(actual)
      encrypted_array = enigma_practice.encrypted_ord(encrypted)
      ord_array = enigma_practice.shift_left(encrypted_array, 3)

      expect(enigma_practice.back_to_og_word(ord_array)).to eq("leigh")
    end
  end
end
