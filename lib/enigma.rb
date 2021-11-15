require './lib/decryption'
require './lib/encryption'
require 'date'

class Enigma
  attr_reader :encrypted_hash, :decrypted_hash

  def initialize
    @encrypted_hash = {
      encryption: "",
      key: "",
      date: ""
    }
    @decrypted_hash = {
      decryption: "",
      key: "",
      date: ""
    }

  end

  def encrypt(message, key = rand.to_s[2..6], date = default_date)
    encrypt = Encrypt.new(message, key, date)
    @encrypted_hash[:encryption] = encrypt.encrypt_message(message)
    @encrypted_hash[:key] = key
    @encrypted_hash[:date] = date
    @encrypted_hash
  end

  def decrypt(message, key = rand.to_s[2..6], date = default_date)
    decrypt = Decrypt.new(message, key, date)
    @decrypted_hash[:decryption] = decrypt.decrypt_message(message)
    @decrypted_hash[:key] = key
    @decrypted_hash[:date] = date
    @decrypted_hash
  end

  def default_date
    # date1 = Date.today doesnt work for me
    time = Time.new
    date_unstripped = time.strftime("%m/%d/%Y")
    month = date_unstripped[0..1]
    day = date_unstripped[3..4]
    year = date_unstripped[8..9]
    date = month + day + year
  end

  def default key

  end

end
# return_hash = {}
# encrypt1 = Encrypt.new(message, key, date)
# return_hash.merge!(encrypt1.encrypt(message))



  # def off_set_encrypt_value
  #   new_hash_off_set = Hash.new
  #   new_value = 0
  #   date_paired_to_letters.each do |key , value|
  #     key_paired_to_letters.each do |key1, value1|
  #       if key == key1
  #         new_value = (value.to_i + value1.to_i)
  #         new_hash_off_set[key] = new_value
  #       end
  #     end
  #   end
  #   new_hash_off_set.values
  # end
  #
  # def off_set_decrypt_value
  #   new_hash_off_set = Hash.new
  #   new_value = 0
  #   date_paired_to_letters.each do |key , value|
  #     key_paired_to_letters.each do |key1, value1|
  #       if key == key1
  #         new_value = (value1.to_i - value.to_i)
  #         new_hash_off_set[key] = new_value
  #       end
  #     end
  #   end
  #   new_hash_off_set.values
  # end

  #
  # def index_message_letters(message)
  #   index_of_message = []
  #   message.downcase.split('').each do |letter|
  #     @alphabet.each do |letter1|
  #       if letter == letter1
  #         index_of_message.push(@alphabet.find_index(letter1))
  #       end
  #     end
  #   end
  #   index_of_message
  # end

  # def index_encrypted(message)
  #   new_message = []
  #     index_message_letters(message).each_with_index do |letter_index , index|
  #       off_set_encrypt_value.each_with_index do |off_set, index1|
  #         if (index % 4) == index1
  #           new_message.push(off_set + letter_index)
  #         end
  #       end
  #     end
  #   new_message
  # end

  # def index_decrypted(message)
  #   new_message = []
  #     index_message_letters(message).each_with_index do |letter_index , index|
  #       off_set_encrypt_value.each_with_index do |off_set, index1|
  #         if (index % 4) == index1
  #           new_message.push(letter_index - off_set)
  #         end
  #       end
  #     end
  #   new_message
  # end
  #
  # def encrypt(message)
  #   index_encrypted(message).map do |letter|
  #     @alphabet.rotate(letter).first
  #   end.join('')
  # end
  #
  # def decrypt(message)
  #   index_decrypted(message).map do |letter|
  #     @alphabet.rotate(letter).first
  #   end.join('')
  # end





# def new_letters(message)
#   new_letters = []
#   message.downcase.split('').each do |letter|
#     @alphabet.each do |letter1|
#         if letter == letter1
#           off_set_encrypt_value.each do |off_set|
#           new_total = letter.ord + off_set[1]
#           new_letters.push(new_total)
#         elsif letter.ord == 32
#           letter1[0].ord + (off_set[1] - 1)
#         end
#       end
#     end
#   end
#   new_letters
# end
