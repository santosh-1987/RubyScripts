require 'pry'

class Combination
  def self.bruteforce(arr)
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

  def self.combinations_using_recursion(arr)
    if arr.length == 0
      return [[]]
    end
    first_element = arr[0]
    arr.shift
    combs_without_first = combinations_using_recursion(arr)
    combs_with_first = []
    combs_without_first.each do |comb|
      combs_with_first << [first_element, *comb]
    end
    puts
    print [*combs_without_first, *combs_with_first]
    puts
    return [*combs_without_first, *combs_with_first]
  end
end

# combinations = Combination.bruteforce([1, 2, 3, 4])
combinations = Combination.combinations_using_recursion([1, 2, 3])
# puts "Count: #{combinations.uniq.count}"
# print combinations
# puts
# combinations.each do |combs|
#   print combs
#   puts
# end