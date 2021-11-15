require 'simplecov'
SimpleCov.start

require './lib/date'
require './lib/encryption'

RSpec.describe Encrypt do
  before :each do
    @encrypt = Encrypt.new("hello", "02715", '040895')
  end

  it "squares the number " do
    expect(@encrypt.squared).to eq("1672401025")
  end

  it "gets the last four digits of the date.squared" do
    expect(@encrypt.last_four).to eq(["1", "0", "2", "5"])
  end

  it "checks that the last four were assigned to letters" do
    expected = { "A" => '1', "B" => '0', "C" => '2', "D" => '5'}
    expect(@encrypt.date_paired_to_letters).to eq(expected)
  end

  it "exists" do
    expect(@encrypt).to be_a(Encrypt)
  end

  it "checks that the key is being grouped by A..D" do
    expect(@encrypt.break_keys_into_pairs).to be_a(Array)
  end

  it "groups the keys to Letters" do
    expect(@encrypt.key_paired_to_letters).to be_a(Hash)
  end

  it "has a alphabet set " do
    expect(@encrypt.message).to eq("hello")
    expect(@encrypt.key).to eq("02715")
    expect(@encrypt.date).to eq('040895')
    expect(@encrypt.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "creates the off_set_encrypt " do
    expect(@encrypt.off_set_encrypt_value).to eq([3, 27, 73, 20])
    expect(@encrypt.off_set_encrypt_value).to be_a(Array)
  end

  it "returns a encrypted message " do
    expect(@encrypt.index_encrypted("HELLO")).to eq([10, 31, 84, 31, 17])    #"d w"
    expect(@encrypt.index_encrypted("HELLO")).to be_a(Array)    #"d w"
  end

  it "checks the letter for the off saet value" do
    expect(@encrypt.index_message_letters("HELLO")).to eq([7, 4, 11, 11, 14])
  end

  it "returns the encrypted message " do
    expect(@encrypt.encrypt_message("hello")).to be_a(String)
    expect(@encrypt.encrypt_message("hello")).to eq('keder')
  end

end
