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

  def change_array_to_ord
    alphabet.map do |alpha|
      alpha.ord
    end
  end

  def single_letter_ord(letter)
    letter.ord
  end
end
