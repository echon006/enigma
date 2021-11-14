require 'simplecov'
SimpleCov.start

require './lib/date'
require './lib/decrypt'

RSpec.describe Decrypt do
  before :each do

    @decrypt = Decrypt.new('keder', "02715", '040895')
  end

  it "exists" do
    expect(@decrypt).to be_a(Decrypt)
  end

  it "has a alphabet set " do
    expect(@decrypt.message).to eq('keder')
    expect(@decrypt.key).to eq("02715")
    expect(@decrypt.date).to eq('040895')
    expect(@decrypt.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "squares the number " do
    expect(@decrypt.squared).to eq("1672401025")
  end

  it "gets the last four digits of the date.squared" do
    expect(@decrypt.last_four).to eq(["1", "0", "2", "5"])
  end

  it "checks that the last four were assigned to letters" do
    expected = { "A" => '1', "B" => '0', "C" => '2', "D" => '5'}
    expect(@decrypt.date_paired_to_letters).to eq(expected)
  end

  it "creates the off_set_encrypt " do
    #test works when key is a set value
    expect(@decrypt.off_set_decrypt_value).to eq([3, 27, 73, 20])
    expect(@decrypt.off_set_decrypt_value).to be_a(Array)
  end

  it "returns a encrypted message " do
    expect(@decrypt.index_decrypted("HELLO")).to eq([4, -23, -62, -9, 11])    #"d w"
    expect(@decrypt.index_decrypted('keder')).to be_a(Array)    #"d w"
  end

  it "checks the letter for the off saet value" do
    expect(@decrypt.index_message_letters('keder')).to eq([10, 4, 3, 4, 17])
  end

  it "returns the decrypted message " do
    expect(@decrypt.decrypt_message('keder')).to be_a(String)
  end

  it "returns the decrypted message " do
    expect(@decrypt.decrypt_message('keder')).to eq('hello')
  end
end
