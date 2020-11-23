require 'byebug'

class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.join.to_i.hash
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    integers = []

    self.each_char { |char| integers << alphabet.index(char) }
    integers.join.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alphabet = ("a".."z").to_a

    hash_code = []
    self.each do |k, v|
      k_code = alphabet.index(k.to_s)
      if v.is_a?(String)
        v_code = alphabet.index(v)
      else
        v_code = v
      end
      hash_code << (k_code ^ v_code).to_s(2)
    end

    hash_code2 = hash_code.first
    (1...hash_code.length).each do |code|
      hash_code2 = (hash_code2.to_i ^ code).to_s(2)
    end

    hash_code2.to_i.hash
  end
end
