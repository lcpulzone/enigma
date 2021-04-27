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

  context 'letter changing with .ord and .chr -dynamic-' do
    it 'can change a word into an ordinal' do
      crypt = Crypt.new

      expect(crypt.message_to_ord("leigh")).to eq([108, 101, 105, 103, 104])
    end
  end

  context 'crypt & decrypt with optional key added' do
    it 'message_to_ord can take an upper or lower case letter' do
      crypt = Crypt.new

      expect(crypt.message_to_ord("Leigh")).to eq([108, 101, 105, 103, 104])
    end

    it 'encrypt_message can change word according to calculated shift' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("leigh")

      expect(crypt.encrypt_message(expected, [2, 20, 13, 10])).to eq([110, 121, 118, 113, 106])
    end

    it 'encrypt_message can change a full name according to calculated shift' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("amber leigh")
      shift_key = [2, 20, 13, 10]
      actual = [99, 102, 111, 111, 116, 32, 121, 111, 107, 97, 117]

      expect(crypt.encrypt_message(expected, shift_key)).to eq(actual)
    end

    it 'shifted_num_array can turn shifted ordinal array into crypted letters' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("amber leigh")
      actual = crypt.encrypt_message(expected, [2, 20, 13, 10])

      expect(crypt.shifted_num_array(actual)).to eq("cfoot yokau")
    end

    it 'crypted_ord can turn string into ordinal array' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("amber leigh")
      actual = crypt.encrypt_message(expected, [2, 20, 13, 10])
      encrypted = crypt.shifted_num_array(actual)
      encrypted_ord_array = [99, 102, 111, 111, 116, 32, 121, 111, 107, 97, 117]

      expect(crypt.encrypted_ord(encrypted)).to eq(encrypted_ord_array)
    end

    it 'decrypt_messagecan change shift an ordinal array accoring to the key' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("amber leigh")
      actual = crypt.encrypt_message(expected, [2, 20, 13, 10])
      encrypted = crypt.shifted_num_array(actual)
      encrypted_ordinal_array = crypt.encrypted_ord(encrypted)
      shift_key = [2, 20, 13, 10]
      normal_array = [97, 109, 98, 101, 114, 32, 108, 101, 105, 103, 104]

      expect(crypt.decrypt_message(encrypted_ordinal_array, shift_key)).to eq(normal_array)
    end

    it 'back_to_og_word can turn the normal array to a word' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("amber leigh")
      actual = crypt.encrypt_message(expected, [2, 20, 13, 10])
      encrypted = crypt.shifted_num_array(actual)
      encrypted_ordinal_array = crypt.encrypted_ord(encrypted)
      shift_key = [2, 20, 13, 10]
      normal_array = crypt.decrypt_message(encrypted_ordinal_array, shift_key)

      expect(crypt.back_to_og_word(normal_array)).to eq("amber leigh")
    end
  end
end

# 33, 64, 35, 36, 37, 94, 38, 42, 40, 41, 123, 125, 91, 93, 124, 63, 47, 62, 60, 44, 46, 58, 58, 59, 39, 39, 95, 45, 43, 61
