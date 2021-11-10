require 'simplecov'
SimpleCov.start

require "./lib/key"

RSpec.describe Key do
  before :each do
    @key = Key.new
  end

  it "exist" do
    expect(@key).to be_a(Key)
  end

  it "checks that @keys is a random 5 digit number" do
    expect(@key.keys.split("").count).to eq(5)
  end

  it "checks that the key is being grouped by A..D" do
    expect(@key.break_keys_into_pairs).to be_a(Array)
  end

  it "groups the keys to Letters" do
    expect(@key.keys_paired_to_letters).to be_a(Hash)
  end
end
