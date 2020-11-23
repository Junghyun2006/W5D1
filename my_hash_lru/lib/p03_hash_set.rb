class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @count += 1
    end
    resize! if count >= num_buckets
  end

  def remove(num)
      unless self[num].empty?
        self[num].delete(num)
        @count -= 1
      end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]  
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_nums = @store.flatten
    @store = Array.new(num_buckets*2) {Array.new}

    old_nums.each do |num|
      insert(num)
      @count -= 1
    end

  end
end
