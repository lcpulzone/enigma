require 'date'
require_relative 'key'
require_relative 'crypt'

class Enigma
  attr_reader :key,
                   :crypt,
                   :range,
                   :num_array

  def initialize
    @key = Key.new
    @crypt = Crypt.new
    @range = (0..9).to_a
    @num_array = @range.sample(5)
  end

  def encrypt(message, key = @num_array, date = Date.today.strftime('%d%m%y').to_i)
    encrypted_key = @key.key_generator(key)
    encrypted_offset = @key.calculate_offset(date)
    shift_key = @key.final_shift(encrypted_key, encrypted_offset)
    message_as_ord = @crypt.message_to_ord(message)
    encrypted_ordinal_array = @crypt.encrypt_message(message_as_ord, shift_key)
    encrypted_message = @crypt.ordinal_to_characters(encrypted_ordinal_array)

    if key.class == String
      encrypted_hash = {
        encryption: encrypted_message,
        key: key,
        date: date.to_s
      }
    else
      encrypted_hash = {
        encryption: encrypted_message,
        key: key.join,
        date: date.to_s
      }
    end
  end

  def decrypt(message, key, date = Date.today.strftime('%d%m%y').to_i)
    encrypted_key = @key.key_generator(key)
    encrypted_offset = @key.calculate_offset(date)
    shift_key = @key.final_shift(encrypted_key, encrypted_offset)
    encrypted_ord = @crypt.message_to_ord(message)
    decrypted_ordinal_array = @crypt.decrypt_message(encrypted_ord, shift_key)
    decrypted_message = @crypt.ordinal_to_characters(decrypted_ordinal_array)

    if key.class == String
      encrypted_hash = {
        decryption: decrypted_message,
        key: key,
        date: date.to_s
      }
    else
      encrypted_hash = {
        decryption: decrypted_message,
        key: key.join,
        date: date.to_s
      }
    end
  end
end
