require 'simplecov'
SimpleCov.start

require './lib/enigma'
require './lib/decryption'
require './lib/encryption'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
    @encryption = Encryption.new("hello world", "02715", "040895")
    @decryption = Decryption.new("keder ohulw", "02715", "040895")
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

  xit "checks that default date is given in the ocrrect format" do
    expect(@enigma.default_date).to eq('111521')
  end

  xit "checks that enigma is encrypting the message and auto filling the date" do
    expected = {
    encryption: "mifatdqdwpy",
    key: "02715",
    date: "111521"
      }
    expect(@enigma.encrypt("hello world", "02715")).to eq(expected)
  end

  xit "checks that enigma is encrypting the message and auto filling the date and key " do
    expect(@enigma.encrypt("hello world")).to be_a(Hash)
  end

  xit "checks that enigma is decrypting the message and auto filling the date " do
    @enigma.encrypt("hello world", "02715")
    expected = {
    decryption: "hello world" ,
    key: "02715",
    date: "111521"
      }
    expect(@enigma.decrypt(@enigma.encrypted_hash[:encryption], "02715")).to eq(expected)
  end

end
