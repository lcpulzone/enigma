require 'rspec'
require './lib/crypt'
require './lib/key'

RSpec.describe Crypt do
  context 'initialization' do
    it 'exists' do
      crypt = Crypt.new

      expect(crypt).to be_an_instance_of(Crypt)
    end
  end

  context 'letter changing with rotate' do
    it 'can print the alphabet' do
      crypt = Crypt.new

      expected =["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(crypt.alphabet).to eq(expected)
    end

    it 'can change a letter to another letter' do
      crypt = Crypt.new

      expect(crypt.letter_change("a")).to eq("b")
    end

    it 'can change a couple letters' do
      crypt = Crypt.new

      expect(crypt.letter_change("a", 3)).to eq("d")
    end

    it 'can change a couple letters' do
      crypt = Crypt.new

      expect(crypt.letter_change("a", 3, 1)).to eq("e")
    end
  end

  context 'letter changing with .ord and .chr -not dynamic-' do
    it 'can change the array into ordinals' do
      crypt = Crypt.new

      expected = [97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 32]

      expect(crypt.change_array_to_ord).to eq(expected)
    end

    it 'can change a single letter to an ordinal' do
      crypt = Crypt.new

      expect(crypt.single_letter_ord("a")).to eq(97)
    end

    it 'can change a single letter to a different letter' do
      crypt = Crypt.new

      expect(crypt.single_letter_change("a")).to eq("b")
    end

    it 'can change a single letter to a different letter with a default rotation value' do
      crypt = Crypt.new

      expect(crypt.single_letter_change("a", 2)).to eq("c")
    end
  end

  context 'letter changing with .ord and .chr -dynamic-' do
    it 'can change a word into an ordinal' do
      crypt = Crypt.new

      expect(crypt.word_to_ord("leigh")).to eq([108, 101, 105, 103, 104])
    end

    it 'can shift the ord number to the right' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("leigh")

      expect(crypt.shift_right(expected, 3)).to eq([111, 104, 108, 106, 107])
    end

    it 'shifted_num_array can change shifted number array to letters' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("leigh")
      actual = crypt.shift_right(expected, 3)

      expect(crypt.shifted_num_array(actual)).to eq("ohljk")
    end
  end


  context 'decrypt with .ord and .chr -dynamic-' do
    it 'can take an crypted word and change it to an ordinal array' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("leigh")
      actual = crypt.shift_right(expected, 3)
      encrypted = crypt.shifted_num_array(actual)

      expect(crypt.encrypted_ord(encrypted)).to eq([111, 104, 108, 106, 107])
    end

    it 'can shift the ord number to the left' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("leigh")
      actual = crypt.shift_right(expected, 3)
      encrypted = crypt.shifted_num_array(actual)
      encrypted_array = crypt.encrypted_ord(encrypted)

      expect(crypt.shift_left(encrypted_array, 3)).to eq([108, 101, 105, 103, 104])
    end

    it 'can turn ordinal array into a word' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("leigh")
      actual = crypt.shift_right(expected, 3)
      encrypted = crypt.shifted_num_array(actual)
      encrypted_array = crypt.encrypted_ord(encrypted)
      ord_array = crypt.shift_left(encrypted_array, 3)

      expect(crypt.back_to_og_word(ord_array)).to eq("leigh")
    end
  end

  context 'crypt & decrypt with optional key added' do
    it 'word_to_ord can take an upper or lower case letter' do
      crypt = Crypt.new

      expect(crypt.word_to_ord("Leigh")).to eq([108, 101, 105, 103, 104])
    end

    it 'given_shift_right can change word according to calculated shift' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("leigh")

      expect(crypt.given_shift_right(expected, [2, 20, 13, 10])).to eq([110, 121, 118, 113, 106])
    end

    it 'given_shift_right can change a full name according to calculated shift' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("amber leigh")
      shift_key = [2, 20, 13, 10]
      actual = [99, 102, 111, 111, 116, 32, 101, 114, 115, 105, 97]

      expect(crypt.given_shift_right(expected, shift_key)).to eq(actual)
    end

    it 'shifted_num_array can turn shifted ordinal array into crypted letters' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("amber leigh")
      actual = crypt.given_shift_right(expected, [2, 20, 13, 10])

      expect(crypt.shifted_num_array(actual)).to eq("cfoot ersia")
    end

    it 'crypted_ord can turn string into ordinal array' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("amber leigh")
      actual = crypt.given_shift_right(expected, [2, 20, 13, 10])
      encrypted = crypt.shifted_num_array(actual)
      encrypted_ord_array = [99, 102, 111, 111, 116, 32, 101, 114, 115, 105, 97]

      expect(crypt.encrypted_ord(encrypted)).to eq(encrypted_ord_array)
    end

    it 'given_shift_left can change shift an ordinal array accoring to the key' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("amber leigh")
      actual = crypt.given_shift_right(expected, [2, 20, 13, 10])
      encrypted = crypt.shifted_num_array(actual)
      encrypted_ordinal_array = crypt.encrypted_ord(encrypted)
      shift_key = [2, 20, 13, 10]
      normal_array = [97, 109, 98, 101, 114, 32, 108, 101, 105, 103, 104]

      expect(crypt.given_shift_left(encrypted_ordinal_array, shift_key)).to eq(normal_array)
    end

    it 'back_to_og_word can turn the normal array to a word' do
      crypt = Crypt.new
      expected = crypt.word_to_ord("amber leigh")
      actual = crypt.given_shift_right(expected, [2, 20, 13, 10])
      encrypted = crypt.shifted_num_array(actual)
      encrypted_ordinal_array = crypt.encrypted_ord(encrypted)
      shift_key = [2, 20, 13, 10]
      normal_array = crypt.given_shift_left(encrypted_ordinal_array, shift_key)

      expect(crypt.back_to_og_word(normal_array)).to eq("amber leigh")
    end
  end
end
