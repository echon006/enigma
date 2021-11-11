class Date
  # include Module
  attr_reader :date

  def initialize(date)
    @date = date || nil
  end

  def squared
    (@date.to_i * @date.to_i).to_s
  end

  def last_four
    squared[-4..-1].split('')
  end

  def date_paired_to_letters  # break_keys_into_pairs.each do |key, value|
    grouped_keys = Hash.new  #   grouped_keys[key] = value
    letter_key = ("A".."D") # {"A" => 0, "B" => 0, "C" => 0, "D" => O}
    letter_key.zip(last_four).to_h  #key.zip(value).to_h
  end
end
