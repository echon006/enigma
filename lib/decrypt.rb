require './lib/enigma'


message_folder = ARGV[0]
decrypted_folder = ARGV[1]
key_given = ARGV[2]
date_given = ARGV[3]


def decrypt(message_folder, decrypted_folder, key_given, date_given)

  enigma = Enigma.new
  new_message = File.open(message_folder)
  read_message_file = new_message.read
  decrypted_message = enigma.decrypt(read_message_file, key_given, date_given)
  open_decrypted_folder = File.open(decrypted_folder, "w")
  update_with_decrypted_message = open_decrypted_folder.write(decrypted_message[:decryption])
  close_file = open_decrypted_folder.close

  puts "Created 'decrypted.txt' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
end

decrypt(message_folder, decrypted_folder, key_given, date_given)
