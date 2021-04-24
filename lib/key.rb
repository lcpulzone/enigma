class Key
  attr_reader :range,
                   :num_array

  def initialize
    @range = (0..9).to_a
    @num_array = @range.sample(5)
  end

  def final_key_creator
    the_key = []
    num_array.each_cons(2) do |num|
      the_key << num.join.to_i
    end
    the_key
  end
end
