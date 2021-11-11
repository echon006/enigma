class Encrypt
  attr_reader :alphabet, :key, :date, :message

  def initialize(message, key, date)
    @alphabet = ("a".."z").to_a << " "
    @key = key
    @date = date
    @message = message
  end

  def off_set_encrypt_value
    new_hash_off_set = Hash.new
    new_value = 0
    @date.date_paired_to_letters.each do |key , value|
      @key.key_paired_to_letters.each do |key1, value1|
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
end
