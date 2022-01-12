require 'pry'

class Combination
  def self.find(arr)
    all_combs = []
    for i in 0...arr.length
      all_combs << [arr[i]]
      comb = [arr[i]]
      for j in i + 1...arr.length
        comb << (arr[j])
        all_combs << comb.dup
      end
      for k in i + 2...arr.length
        all_combs << [arr[i], arr[k]]
      end
    end
    return all_combs
  end
end

combinations = Combination.find([7, 2, 3, 4])
puts "Count: #{combinations.uniq.count}"
combinations.each do |combs|
  print combs
  puts
end