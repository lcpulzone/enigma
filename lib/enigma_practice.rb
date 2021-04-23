class EnigmaPractice

  def initialize
    alphabet
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def letter_change(letter, number = 2, index = 0)
    letter.gsub(letter, alphabet.rotate(number)[index])
  end
end
