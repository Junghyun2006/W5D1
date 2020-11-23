class MaxIntSet
  attr_reader :store
  def initialize(max)
      @max = max
      @store = Array.new(max, false)
  end

  def insert(num)
      raise "Out of bounds" unless is_valid?(num)
      validate!(num)
  end

  def remove(num)
      validate!(num)
  end

  def include?(num)
      @store[num]
  end

  private

  def is_valid?(num)
      num <= @max && num >= 0
  end

  def validate!(num)
      @store[num] == true ? @store[num] = false : @store[num] = true
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    @store[num % @num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
