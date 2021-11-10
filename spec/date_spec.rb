require 'simplecov'
SimpleCov.start

require './lib/date'

RSpec.describe Date do
  before :each do
    @date1 = Date.new('040895')
  end

  it "exists" do
    expect(@date1).to be_a(Date)
  end
  it "checks the attribute" do
    expect(@date1.date).to eq('040895')
  end

  it "squares the number " do
    expect(@date1.squared).to eq("1672401025")
  end

  it "gets the last four digits of the date.squared" do
    expect(@date1.last_four).to eq("1025")
  end
end
