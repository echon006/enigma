require './lib/enigma'


message_folder = ARGV[0]
encrypted_folder = ARGV[1]

def encrypt(message_folder, encrypted_folder)

  enigma = Enigma.new
  new_message = File.open(message_folder)
  read_message_file = new_message.read
  encrypted_message = enigma.encrypt(read_message_file)
  open_encrypted_folder = File.open(encrypted_folder, "w")
  update_with_encrypted_message = open_encrypted_folder.write(encrypted_message[:encryption])
  close_file = open_encrypted_folder.close

  puts "Created 'encrypted.txt' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
end

encrypt(message_folder, encrypted_folder)
