class Date
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def squared
    (@date.to_i * @date.to_i).to_s
  end

  def last_four
    squared[-4..-1]
  end
end
