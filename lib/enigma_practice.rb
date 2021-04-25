class EnigmaPractice

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

###USING ORD & CHR -DYNAMIC-###
  def word_to_ord(word)
    word.chars.map do |letter|
      letter.ord
    end
  end

  def shift_right(letter_array, key = 1)
    letter_array.map do |letter|
      letter + key
    end
  end

  # need an if statement, need to know when to reset it to 0, If it's reached 5 reset to 0
  #put an if statement here to check the counter (is it over? restart if so) (length - 1)
  # need to be able to tell the key when to go back to zero = 1)
  def given_shift_right(letter_array, key = 1)
    amount = letter_array.count
    counter = 0
    shifted = letter_array.map do |letter|
      if counter == 4
        counter = 0
      end
      if letter == 32
        letter = 32
      else
        result = (letter + key[counter])
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

  def shift_left(encrypted_array, key = 1)
    encrypted_array.map do |array|
      array - key
    end
  end

  def back_to_og_word(ord_array)
    word = ord_array.map do |array|
      array.chr
    end
    word.join
  end
end
