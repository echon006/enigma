require 'simplecov'
require './lib/encrypt'
SimpleCov.start

RSpec.describe Enigma do
  before :each do
    @encrypt = Enigma.new("Hello", "02715", "040895")
  end

  it "exists" do
    expect(@encrypt).to be_a(Enigma)
  end

  it "has a alphabet set " do
    expect(@encrypt.message).to eq("Hello")
    expect(@encrypt.key).to eq("02715")
    expect(@encrypt.date).to eq("040895")
    expect(@encrypt.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

end
