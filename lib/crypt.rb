class Crypt

  def message_to_ord(message)
    message.chars.map do |letter|
      (letter.downcase).ord
    end
  end

  def encrypt_message(letter_array, key = 1)
    counter = 0
    shifted = letter_array.map do |letter|
      if counter == 4
        counter = 0
      end
      if letter == 32
        counter += 1
        letter = 32
      else
        if (letter + key[counter]) < 123
          result = (letter + key[counter])
        elsif (letter + key[counter]) == 123
          result = (letter + key[counter]) - 26
        elsif (letter + key[counter]) > 123
          result = (letter + key[counter]) - 27
        end
        counter += 1
        result
      end
    end
  end

  def shifted_num_array(num_array)
    shifted_word = num_array.map do |num|
      num.chr
    end
    shifted_word.join
  end

  def encrypted_ord(encrypted_word)
    encrypted_word.chars.map do |word|
      word.ord
    end
  end

  def decrypt_message(letter_array, key = 1)
    counter = 0
    shifted = letter_array.map do |letter|
      if counter == 4
        counter = 0
      end
      if letter == 32
        counter += 1
        letter = 32
      else
        if letter == 97
          result = (letter + 26) - key[counter]
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

  def back_to_og_word(ord_array)
    word = ord_array.map do |array|
      array.chr
    end
    word.join
  end
end
