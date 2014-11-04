class MyHashTable
  attr_reader :buckets
  def initialize
    @buckets = []
  end

  def find(key)
    index = hash(key)
    @buckets[index].each do |key_value_pair|
      return key_value_pair.last if key_value_pair.first == key
    end
  end

  def insert(key, value)
    index = hash(key)
    @buckets[index] ||= []
    @buckets[index] << [key, value]
  end

  def hash(key)
    (key.to_sym.object_id % 1000) - (key.to_sym.object_id / 10000)
  end
end
