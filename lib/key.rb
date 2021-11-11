class Key
  # include Module
  attr_reader :keys

  def initialize
    @keys = rand.to_s[2..6]
  end

  def break_keys_into_pairs
    consecutive = []
    @keys.split("").each_cons(2) do |value|
      consecutive.push(value.join('').to_i)
    end
    consecutive
  end

  def keys_paired_to_letters  # break_keys_into_pairs.each do |key, value|
    grouped_keys = Hash.new  #   grouped_keys[key] = value
    letter_key = ("A".."D") # {"A" => 0, "B" => 0, "C" => 0, "D" => O}
    letter_key.zip(break_keys_into_pairs).to_h  #key.zip(value).to_h
  end

end
