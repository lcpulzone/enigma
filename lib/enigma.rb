require 'key'
require 'encrypt'

class Enigma
  attr_reader :key,
                   :encrypt,
                   :range,
                   :num_array

  def initialize
    alphabet
    @key = Key.new
    @encrypt = Encrypt.new
    @range = (0..9).to_a
    @num_array = @range.sample(5).to_s
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def encrypt(message, key = @num_array, date = Date.today.strftime('%d%m%y').to_i)
    @encrypt.word_to_ord(message)

    # cons_key = []
    # cons_key << key
    # the_key = []
    # cons_key.each_cons(2) { |k| the_key << k.join.to_i }

    #take the key method created in key class

    #take the date method used in key class

    #utilize the shift method used in key class

    #shift message according to the shift key created

    #create hash with message, key and date as a string
  end
end
