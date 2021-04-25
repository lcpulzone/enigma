class Enigma

  def initialize
    alphabet
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def encrypt(message, key = (0..9).sample(5), date = Date.today.strftime('%d%m%y').to_i)
    #take a message split it into each separate character
    #turn each letter into an ordinal

    #take the key method created in key class

    #take the date method used in key class

    #utilize the shift method used in key class

    #shift message according to the shift key created

    #create hash with message, key and date as a string
  end

  def word_to_ord(word)
    word.chars.map do |letter|
      letter.ord
    end
  end
end
