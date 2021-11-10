class Enigma
  attr_reader :alphabet, :key, :date, :message

  def initialize(message , key, date)
    @alphabet = ("a".."z").to_a << " "
    @key = key || nil
    @date = date || nil
    @message = message
  end

end
