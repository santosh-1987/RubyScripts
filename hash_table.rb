# Inspired by Learn Ruby the Hard Way by Zed Shaw
# http://learnrubythehardway.org/book/ex39.html
# https://github.com/minsoo91/hash_table/blob/master/hash_table.rb
class HashTable
  attr_accessor :store
  def initialize(num_buckets=256)
    @store = [];
    (0...num_buckets).each do |i|
      @store.push([]);
    end
    @store
  end
  def hash_key(key)
    return key.hash % @store.length
  end
  def get_bucket(key)
    bucket_id = self.hash_key(key)
    return @store[bucket_id]
  end
  def get_slot(key, default = nil)
    bucket = self.get_bucket(key)
    bucket.each_with_index do |kv, i|
      k, v = kv
      if key == k
        return i, k, v
      end
    end

    return -1, key, default
  end
  def get(key, default=nil)
    i, k, v = self.get_slot(key, default=default)
    return v
  end
  def set(key, value)
    bucket = self.get_bucket(key)
    i, k, v = self.get_slot(key)

    if i >= 0
      bucket[i] = [key, value]
    else
      bucket.push([key, value])
    end
  end
  def delete(key)
    bucket = @store.get_bucket(key)
    (0...bucket.length).each do |i|
      k, v = bucket[i]
      if key == k
        bucket.delete_at(i)
        break
      end
    end
  end
  def list
    @store.each do |bucket|
      if bucket
        bucket.each { |k, v| puts k, v }
      end
    end
  end
end

ht = HashTable.new
ht.set("Santosh",9408442714)
print ht.get("Santosh")