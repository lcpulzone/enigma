class Crypt

  def message_to_ord(message)
    message.chars.map do |letter|
      (letter.downcase).ord
    end
  end

  def ordinal_to_characters(ord_array)
    word = ord_array.map do |array|
      array.chr
    end
    word.join
  end

  def encrypt_message(message_array, key = 1)
    counter = 0
    shifted = message_array.map do |letter|
      if counter == 4
        counter = 0
      end
      if letter == 32
        counter += 1
        letter = 32
      else
        if (letter + key[counter]) < 123
          result = (letter + key[counter])
        elsif (letter + key[counter]) >= 123
          result = (letter + key[counter]) - 27
        end
        counter += 1
        result
      end
    end
  end

  def decrypt_message(message_array, key = 1)
    counter = 0
    shifted = message_array.map do |letter|
      if counter == 4
        counter = 0
      end
      if letter == 32
        counter += 1
        letter = 32
      else
        if letter == 97
          result = (letter + 27) - key[counter]
        elsif (letter - key[counter]) <= 96
          result = (letter + 27) - key[counter]
        elsif
          result = (letter - key[counter])
        end
        counter += 1
        result
      end
    end
  end
end
