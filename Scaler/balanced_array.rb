=begin
Given an integer array A of size N. You need to count the number of special elements in the given array.

A element is special if removal of that element make the array balanced.

Array will be balanced if sum of even index element equal to sum of odd index element.

1 <= N <= 105

1 <= A[i] <= 109

[2, 1, 6, 4] # 1
[5, 5, 2, 5, 8] #2

=end

require 'pry'
class Solution
    # @param a : array of integers
    # @return an integer
    def solve(a)
        raise "Invalid Array" if a.length == 0 
        pse = []
        pso = []
        pse[0] = a[0]
        pso[0] = 0
        a.each_with_index do |val, idx|
            next if idx == 0
            # binding.pry
            if idx%2 == 0
                pse[idx] = val + pse[idx-1]
                pso[idx] = pso[idx-1]
            else
                pso[idx] = val + pso[idx-1] 
                pse[idx] = pse[idx-1]
            end
        end

        ans = 0

        # puts "PSE: #{pse}"
        # puts "PSO: #{pso}"

        for i in 0...a.length
            psei = i - 1 < 0 ? 0 : pse[i-1]
            psoi = i - 1 < 0 ? 0 : pso[i-1]
            sum_even = psei + (pso[a.length-1] - pso[i])
            sum_odd = psoi + (pse[a.length-1] - pse[i])
            ans += 1 if sum_even == sum_odd
        end
        return ans
    end

    def brute_force(a)
        count = 0
        a.each_with_index do |_, idx|
            arr = a.dup
            arr.delete_at(idx)
            ei = arr[0] || nil
            oi = arr[1] || nil
           
            arr.each_with_index do |ele, idx|
                next if idx ==0 || idx ==1
                if idx.even?
                    ei += ele
                else
                    oi += ele
                end
            end
            count += 1 if ei == oi
        end
        return count
    end
end

puts Solution.new.solve([2, 1, 6, 4])
puts Solution.new.solve([5, 5, 2, 5, 8])