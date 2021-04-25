require 'rspec'
require './lib/encrypt'
require './lib/key'

RSpec.describe Encrypt do
  context 'initialization' do
    it 'exists' do
      encrypt = Encrypt.new

      expect(encrypt).to be_an_instance_of(Encrypt)
    end
  end

  context 'letter changing with rotate' do
    it 'can print the alphabet' do
      encrypt = Encrypt.new

      expected =["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(encrypt.alphabet).to eq(expected)
    end

    it 'can change a letter to another letter' do
      encrypt = Encrypt.new

      expect(encrypt.letter_change("a")).to eq("b")
    end

    it 'can change a couple letters' do
      encrypt = Encrypt.new

      expect(encrypt.letter_change("a", 3)).to eq("d")
    end

    it 'can change a couple letters' do
      encrypt = Encrypt.new

      expect(encrypt.letter_change("a", 3, 1)).to eq("e")
    end
  end

  context 'letter changing with .ord and .chr -not dynamic-' do
    it 'can change the array into ordinals' do
      encrypt = Encrypt.new

      expected = [97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 32]

      expect(encrypt.change_array_to_ord).to eq(expected)
    end

    it 'can change a single letter to an ordinal' do
      encrypt = Encrypt.new

      expect(encrypt.single_letter_ord("a")).to eq(97)
    end

    it 'can change a single letter to a different letter' do
      encrypt = Encrypt.new

      expect(encrypt.single_letter_change("a")).to eq("b")
    end

    it 'can change a single letter to a different letter with a default rotation value' do
      encrypt = Encrypt.new

      expect(encrypt.single_letter_change("a", 2)).to eq("c")
    end
  end

  context 'letter changing with .ord and .chr -dynamic-' do
    it 'can change a word into an ordinal' do
      encrypt = Encrypt.new

      expect(encrypt.word_to_ord("leigh")).to eq([108, 101, 105, 103, 104])
    end

    it 'can shift the ord number to the right' do
      encrypt = Encrypt.new
      expected = encrypt.word_to_ord("leigh")

      expect(encrypt.shift_right(expected, 3)).to eq([111, 104, 108, 106, 107])
    end

    it 'shifted_num_array can change shifted number array to letters' do
      encrypt = Encrypt.new
      expected = encrypt.word_to_ord("leigh")
      actual = encrypt.shift_right(expected, 3)

      expect(encrypt.shifted_num_array(actual)).to eq("ohljk")
    end

    xit 'given_shift_right can change word according to calculated shift' do
      encrypt = Encrypt.new
      expected = encrypt.word_to_ord("leigh")

      expect(encrypt.given_shift_right(expected, [2, 20, 13, 10])).to eq([110, 121, 118, 113, 106])
    end

    it 'given_shift_right can change a full name according to calculated shift' do
      encrypt = Encrypt.new
      expected = encrypt.word_to_ord("amber leigh")
      shift_key = [2, 20, 13, 10]
      actual = [99, 102, 111, 111, 116, 32, 101, 114, 115, 105, 97]

      expect(encrypt.given_shift_right(expected, shift_key)).to eq(actual)
    end
  end

  context 'decrypt with .ord and .chr -dynamic-' do
    it 'can take an encrypted word and change it to an ordinal array' do
      encrypt = Encrypt.new
      expected = encrypt.word_to_ord("leigh")
      actual = encrypt.shift_right(expected, 3)
      encrypted = encrypt.shifted_num_array(actual)

      expect(encrypt.encrypted_ord(encrypted)).to eq([111, 104, 108, 106, 107])
    end

    it 'can shift the ord number to the left' do
      encrypt = Encrypt.new
      expected = encrypt.word_to_ord("leigh")
      actual = encrypt.shift_right(expected, 3)
      encrypted = encrypt.shifted_num_array(actual)
      encrypted_array = encrypt.encrypted_ord(encrypted)

      expect(encrypt.shift_left(encrypted_array, 3)).to eq([108, 101, 105, 103, 104])
    end

    it 'can turn ordinal array into a word' do
      encrypt = Encrypt.new
      expected = encrypt.word_to_ord("leigh")
      actual = encrypt.shift_right(expected, 3)
      encrypted = encrypt.shifted_num_array(actual)
      encrypted_array = encrypt.encrypted_ord(encrypted)
      ord_array = encrypt.shift_left(encrypted_array, 3)

      expect(encrypt.back_to_og_word(ord_array)).to eq("leigh")
    end
  end
end
