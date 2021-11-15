require './lib/decryption'
require './lib/encryption'

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
    encrypt = Encryption.new(message, key, date)
    @encrypted_hash[:encryption] = encrypt.encrypt_message(message)
    @encrypted_hash[:key] = key
    @encrypted_hash[:date] = date
    @encrypted_hash
  end

  def decrypt(message, key, date = default_date)
    decrypt = Decryption.new(message, key, date)
    @decrypted_hash[:decryption] = decrypt.decrypt_message(message)
    @decrypted_hash[:key] = key
    @decrypted_hash[:date] = date
    @decrypted_hash
  end

  def default_date # date1 = Date.today doesnt work for me
    time = Time.new
    date_unstripped = time.strftime("%m/%d/%Y")
    month = date_unstripped[0..1]
    day = date_unstripped[3..4]
    year = date_unstripped[8..9]
    date = month + day + year
  end
end
