require 'date'
require 'key'
require 'crypt'

class Enigma
  attr_reader :key,
                   :crypt,
                   :range,
                   :num_array

  def initialize
    alphabet
    @key = Key.new
    @crypt = Crypt.new
    @range = (0..9).to_a
    @num_array = @range.sample(5).to_s
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def encrypt(message, key = num_array, date = Date.today.strftime('%d%m%y').to_i)
    encrypted_key = @key.final_key_creator(key)

    encrypted_offset = @key.create_offset(date)

    shift_key = @key.final_shift(encrypted_key, encrypted_offset)
    message_as_ord = @crypt.word_to_ord(message)
    encrypted_ordinal_array = @crypt.given_shift_right(message_as_ord, shift_key)
    encrypted_message = @crypt.shifted_num_array(encrypted_ordinal_array)

    encrypted_hash = {
      encryption: encrypted_message,
      key: key.to_s,
      date: date.to_s
    }
  end

  def decrypt(message, key, date = Date.today.strftime('%d%m%y').to_i)
    encrypted_key = @key.final_key_creator(key)

    encrypted_offset = @key.create_offset(date)

    shift_key = @key.final_shift(encrypted_key, encrypted_offset)

    encrypted_ord = @crypt.encrypted_ord(message)
    decrypted_ordinal_array = @crypt.given_shift_left(encrypted_ord, shift_key)
    decrypted_message = @crypt.back_to_og_word(decrypted_ordinal_array)

    encrypted_hash = {
      decryption: decrypted_message,
      key: key.to_s,
      date: date.to_s
    }

  end
end
