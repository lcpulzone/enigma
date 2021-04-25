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

  def create_offset(date)
    sq_date = date.strftime('%m%d%y').to_i
    last_dig = (sq_date**2).to_s
    the_almost_offset = last_dig[6..9]
    @the_offset << the_almost_offset.split("")
    @the_offset.flatten!
  end

  def final_shift
    final = []
    final << (@the_key[0] + (@the_offset[0]).to_i)
    final << (@the_key[1] + (@the_offset[1]).to_i)
    final << (@the_key[2] + (@the_offset[2]).to_i)
    final << (@the_key[3] + (@the_offset[3]).to_i)
    final
  end
end
