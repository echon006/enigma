class Encryption
  attr_reader :alphabet, :key, :date, :message

  def initialize(message, key, date)
    @alphabet = ("a".."z").to_a << " "
    @key = key
    @date = date
    @message = message
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

  def break_keys_into_pairs
    consecutive = []
    @key.split("").each_cons(2) do |value|
      consecutive.push(value.join('').to_i)
    end
    consecutive
  end

  def key_paired_to_letters  # break_keys_into_pairs.each do |key, value|
    grouped_keys = Hash.new  #   grouped_keys[key] = value
    letter_key = ("A".."D") # {"A" => 0, "B" => 0, "C" => 0, "D" => O}
    letter_key.zip(break_keys_into_pairs).to_h  #key.zip(value).to_h
  end

  def off_set_encrypt_value
    new_hash_off_set = Hash.new
    new_value = 0
    date_paired_to_letters.each do |key , value|
      key_paired_to_letters.each do |key1, value1|
        if key == key1
          new_value = (value.to_i + value1.to_i)
          new_hash_off_set[key] = new_value
        end
      end
    end
    new_hash_off_set.values
  end

  def index_encrypted(message)
    new_message = []
      index_message_letters(message).each_with_index do |letter_index , index|
        off_set_encrypt_value.each_with_index do |off_set, index1|
          if (index % 4) == index1
            new_message.push(off_set + letter_index)
          end
        end
      end
    new_message
  end

  def index_message_letters(message)
    index_of_message = []
    message.downcase.split('').each do |letter|
      @alphabet.each do |letter1|
        if letter == letter1
          index_of_message.push(@alphabet.find_index(letter1))
        end
      end
    end
    index_of_message
  end

  def encrypt_message(message)
    index_encrypted(message).map do |letter|
      @alphabet.rotate(letter).first
    end.join('')
  end
end
