require 'simplecov'
SimpleCov.start
require './lib/date'
require './lib/key'
require './lib/encrypt'

RSpec.describe Encrypt do
  before :each do
    @key = Key.new
    @date = Date.new("040895")
    @encrypt = Encrypt.new("hello", @key, @date)
  end

  it "exists" do
    expect(@encrypt).to be_a(Encrypt)
  end

  it "has a alphabet set " do
    expect(@encrypt.message).to eq("hello")
    expect(@encrypt.key).to eq(@key)
    expect(@encrypt.date).to eq(@date)
    expect(@encrypt.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "creates the off_set_encrypt " do
    #test works when key is a set value
    expect(@encrypt.off_set_encrypt_value).to be_a(Array)
  end

  it "returns a encrypted message " do
    expect(@encrypt.index_encrypted("HELLO")).to be_a(Array)    #"d w"
  end
end
