require 'date'
require_relative 'enigma'

class Key
  attr_reader :range,
                   :num_array,
                   :the_key_array,
                   :the_offset_array

  def initialize
    @range = (0..9).to_a
    @num_array = @range.sample(5)
    @the_key_array = []
    @the_offset_array = []
  end

  def key_into_integer(string_key)
    str_k = string_key.split("")
    test = str_k.map do |key|
      key.to_i
    end
    test
  end

  def key_generator(key = @num_array)
    if key.class == String
      key = key_into_integer(key)
    end
      key.each_cons(2) do |num|
        @the_key_array << num.join.to_i
      end
    @the_key_array
  end

  def calculate_offset(date = Date.today)
    sq_date = sq_date
    if date.class == Date
      sq_date = date.strftime('%d%m%y').to_i
    elsif date.class == String
      sq_date = date.to_i
    end
    last_dig = (sq_date**2).to_s
    the_almost_offset = last_dig[6..9]
    @the_offset_array << the_almost_offset.split("")
    @the_offset_array.flatten!
  end

  def final_shift(key = @the_key_array, offset = @the_offset_array)
    # key = key_generator(key = num_array)
    offset = calculate_offset
    counter = 0
    final = @the_key_array.map do |key|
      result = (key + @the_offset_array[counter].to_i)
      counter += 1
      result
    end
    offset = final.map do |fine|
      fine % 27
    end
    offset
  end
end
