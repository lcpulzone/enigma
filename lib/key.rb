require 'date'

class Key
  attr_reader :range,
                   :num_array,
                   :the_key,
                   :the_offset

  def initialize
    @range = (0..9).to_a
    @num_array = @range.sample(5)
    @the_key = []
    @the_offset = []
  end

  def final_key_creator
    num_array.each_cons(2) do |num|
      @the_key << num.join.to_i
    end
    @the_key
  end

  def create_offset(date = Date.today)
    sq_date = date.strftime('%d%m%y').to_i
    last_dig = (sq_date**2).to_s
    the_almost_offset = last_dig[6..9]
    @the_offset << the_almost_offset.split("")
    @the_offset.flatten!
  end

  def final_shift
    counter = 0
    final = @the_key.map do |key|
      result = (key + @the_offset[counter].to_i)
      counter += 1
      result
    end
    offset = final.map do |fine|
      fine % 27
    end
    offset
  end
end
