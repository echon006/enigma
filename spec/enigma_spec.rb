require 'simplecov'
SimpleCov.start

require './lib/enigma'
require './lib/decryption'
require './lib/encryption'
require 'date'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
    @encryption = Encrypt.new("hello world", "02715", "040895")
    @decryption = Decrypt.new("keder ohulw", "02715", "040895")
  end

  it "exists" do
    expect(@enigma).to be_a(Enigma)
    expect(@enigma.encrypted_hash).to eq({
      encryption: "",
      key: "",
      date: ""
    })
  end

  it "checks that enigma is encrypting the message" do
    expected = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
      }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it "checks that enigma is decrypting the message" do
    expected = {
    decryption: "hello world",
    key: "02715",
    date: "040895"
      }
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it "checks that default date is given in the ocrrect format" do
    expect(@enigma.default_date).to eq('111521')
  end

  it "checks that enigma is encrypting the message and auto filling the date" do
    expected = {
    encryption: "mifatdqdwpy",
    key: "02715",
    date: "111521"
      }
    expect(@enigma.encrypt("hello world", "02715")).to eq(expected)
  end
  
end
#   it "has a alphabet set " do
#     expect(@enigma.message).to eq("Hello")
#     expect(@enigma.key).to eq("02715")
#     expect(@enigma.date).to eq("040895")
#     expect(@enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
#   end
#
#   it "checks the attribute" do
#     expect(@enigma.date).to eq('040895')
#   end
#
#   it "squares the number " do
#     expect(@enigma.squared).to eq("1672401025")
#   end
#
#   it "gets the last four digits of the date.squared" do
#     expect(@enigma.last_four).to eq(["1", "0", "2", "5"])
#   end
#
#   it "checks that the last four were assigned to letters" do
#     expected = { "A" => '1', "B" => '0', "C" => '2', "D" => '5'}
#     expect(@enigma.date_paired_to_letters).to eq(expected)
#   end
#
#
#   it "checks that @keys is a random 5 digit number" do
#     expect(@enigma.key.split("").count).to eq(5)
#   end
#
#   it "checks that the key is being grouped by A..D" do
#     expect(@enigma.break_keys_into_pairs).to be_a(Array)
#   end
#
#   it "groups the keys to Letters" do
#     expect(@enigma.key_paired_to_letters).to be_a(Hash)
#   end
#
#   it "creates the off_set_encrypt " do
#     expect(@enigma.off_set_encrypt_value).to eq([3, 27, 73, 20])
#   end
#
#   it "creates the off_set_decrypt" do
#     expect(@enigma.off_set_decrypt_value).to eq([1, 27, 69, 10])
#   end
#
#   it "checks the letter for the off saet value" do
#     expect(@enigma.index_message_letters("HELLO")).to eq([7, 4, 11, 11, 14])
#   end
#
#   it "returns a encrypted message " do
#     expect(@enigma.index_encrypted("HELLO")).to eq([10, 31, 84, 31, 17])    #"d w"
#   end
#
#   it "returns the encrypted message " do
#     expect(@enigma.encrypt("Hello")).to eq('keder')
#   end
#
#   it "returns a decyphered message" do
#     expect(@enigma.decrypt("keder")).to eq("hello")
#   end
# end
