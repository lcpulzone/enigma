class Crypt

  def initialize
    alphabet
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def letter_change(letter, number = 1, index = 0)
    letter.gsub(letter, alphabet.rotate(number)[index])
  end

###USING ORD & CHR -NOT DYNAMIC-###
  def change_array_to_ord
    alphabet.map do |alpha|
      alpha.ord
    end
  end

  def single_letter_ord(letter)
    letter.ord
  end

  def single_letter_change(letter, num = 1)
    (single_letter_ord(letter) + num).chr
  end

  def shift_right(letter_array, key = 1)
    letter_array.map do |letter|
      letter + key
    end
  end

  def shift_left(encrypted_array, key = 1)
    encrypted_array.map do |array|
      array - key
    end
  end

###ENCRYPT -DYNAMIC-###
  def word_to_ord(word)
    word.chars.map do |letter|
      (letter.downcase).ord
    end
  end

  def given_shift_right(letter_array, key = 1)
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

###DECRYPTING###
  def encrypted_ord(encrypted_word)
    encrypted_word.chars.map do |word|
      word.ord
    end
  end

  def given_shift_left(letter_array, key = 1)
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
