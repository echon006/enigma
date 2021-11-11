require 'simplecov'
require './lib/enigma'

SimpleCov.start

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new("Hello", "02715", "040895")
  end

  it "exists" do
    expect(@enigma).to be_a(Enigma)
  end

  it "has a alphabet set " do
    expect(@enigma.message).to eq("Hello")
    expect(@enigma.key).to eq("02715")
    expect(@enigma.date).to eq("040895")
    expect(@enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "checks the attribute" do
    expect(@enigma.date).to eq('040895')
  end

  it "squares the number " do
    expect(@enigma.squared).to eq("1672401025")
  end

  it "gets the last four digits of the date.squared" do
    expect(@enigma.last_four).to eq(["1", "0", "2", "5"])
  end

  it "checks that the last four were assigned to letters" do
    expected = { "A" => '1', "B" => '0', "C" => '2', "D" => '5'}
    expect(@enigma.date_paired_to_letters).to eq(expected)
  end


  it "checks that @keys is a random 5 digit number" do
    expect(@enigma.key.split("").count).to eq(5)
  end

  it "checks that the key is being grouped by A..D" do
    expect(@enigma.break_keys_into_pairs).to be_a(Array)
  end

  it "groups the keys to Letters" do
    expect(@enigma.key_paired_to_letters).to be_a(Hash)
  end

  it "creates the off_set_encrypt " do
    expect(@enigma.off_set_encrypt_value).to eq({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
  end

  it "creates the off_set_decrypt" do
    expect(@enigma.off_set_decrypt_value).to eq({"A" => 1, "B" => 27, "C" => 69, "D" => 10})
  end
end
