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
      actual = [99, 102, 111, 111, 116, 32, 121, 111, 107, 96, 117]

      expect(crypt.encrypt_message(expected, shift_key)).to eq(actual)
    end

    it 'ordinal_to_characters can turn shifted ordinal array into crypted letters' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("amber leigh")
      actual = crypt.encrypt_message(expected, [2, 20, 13, 10])

      expect(crypt.ordinal_to_characters(actual)).to eq("cfoot yok`u")
    end

    it 'crypted_ord can turn string into ordinal array' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("amber leigh")
      actual = crypt.encrypt_message(expected, [2, 20, 13, 10])
      encrypted = crypt.ordinal_to_characters(actual)
      encrypted_ord_array = [99, 102, 111, 111, 116, 32, 121, 111, 107, 96, 117]

      expect(crypt.message_to_ord(encrypted)).to eq(encrypted_ord_array)
    end

    it 'decrypt_messagecan change shift an ordinal array accoring to the key' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("amber leigh")
      actual = crypt.encrypt_message(expected, [2, 20, 13, 10])
      encrypted = crypt.ordinal_to_characters(actual)
      encrypted_ordinal_array = crypt.message_to_ord(encrypted)
      shift_key = [2, 20, 13, 10]
      normal_array = [97, 109, 98, 101, 114, 32, 108, 101, 105, 103, 104]

      expect(crypt.decrypt_message(encrypted_ordinal_array, shift_key)).to eq(normal_array)
    end

    it 'ordinal_to_characters can turn the normal array to a word' do
      crypt = Crypt.new
      expected = crypt.message_to_ord("amber leigh")
      actual = crypt.encrypt_message(expected, [2, 20, 13, 10])
      encrypted = crypt.ordinal_to_characters(actual)
      encrypted_ordinal_array = crypt.message_to_ord(encrypted)
      shift_key = [2, 20, 13, 10]
      normal_array = crypt.decrypt_message(encrypted_ordinal_array, shift_key)

      expect(crypt.ordinal_to_characters(normal_array)).to eq("amber leigh")
    end
  end
end
