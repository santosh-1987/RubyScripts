=begin
Given an array A of N integers.

Find the largest continuous sequence in a array which sums to zero.



Problem Constraints

1 <= N <= 106

-107 <= A[i] <= 107



Input Format

Single argument which is an integer array A.



Output Format

Return an array denoting the longest continuous sequence with total sum of zero.

NOTE : If there are multiple correct answers, return the sequence which occurs first in the array.



Example Input

A = [1,2,-2,4,-4]


Example Output

[2,-2,4,-4]


Example Explanation

[2,-2,4,-4] is the longest sequence with total sum of zero.


Approach:


There are two steps:
1. Create cumulative sum array where ith index in this array represents total sum from 1 to ith index element.
2. Iterate all elements of cumulative sum array and use hashing to find two elements where value at ith index == value at jth index but i != j.
3. IF element is not present in hash in fill hash table with current element.

https://www.scaler.com/academy/mentee-dashboard/class/23211/assignment/problems/298/hints?navref=cl_pb_nv_tb

public class Solution {
    public ArrayList<Integer> lszero(ArrayList<Integer> A) {
        ArrayList<Integer> rst = new ArrayList<Integer>();
        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
        if(A == null) return rst;
        int len = 0;
        int sum = 0;
        int l = -1, r = -1;
        map.put(0, -1);
        for(int i = 0; i < A.size(); i++){
            sum += A.get(i);
            if(!map.containsKey(sum))
                map.put(sum, i);
            else{
                if(i - map.get(sum) > len){
                    l = map.get(sum) + 1;
                    r = i;
                    len = i - map.get(sum);
                }
            }
        }
        if(l >=0 && r >= 0){
            for(int i = l; i <= r; i++){
                rst.add(A.get(i));
            }
        }
        return rst;
    }
}
=end

require 'pry'

class Solution
  # @param a : array of integers
  # @return an array of integers
  def lszero(a)
    hash = {}
    largest_length = 0
    largest_length_index = nil
    prefix_sum = [a[0]]
    hash[a[0]] = [0]
    zeroth_index = a[0] == 0 ? 0 : nil
    for i in 1...a.length
      sum = prefix_sum[i - 1] + a[i]
      prefix_sum[i] = sum
      zeroth_index = i if sum == 0
      if hash[sum].nil?
        hash[sum] = [i]
      else
        hash[sum] << i
      end
    end
    # puts "#{prefix_sum}"
    # puts hash.select {|key, value| value.length > 1}
    unless zeroth_index.nil?
      largest_length = zeroth_index + 1
      largest_length_index = [0, zeroth_index]
    end
    # binding.pry
    Hash[hash.select { |key, value| value.length > 1 }].each_pair do |key, value|
      if value[0] == 0
        if largest_length < value.last
          largest_length = value.last
          largest_length_index = [value.first + 1, value.last]
        end
        # largest_length = largest_length > value.last ? largest_length : value.last
        # largest_length_index = [value.first + 1, value.last]
      else
        if largest_length < value.last - value.first
          largest_length = value.last - value.first
          largest_length_index = [value.first + 1, value.last]
        end
      end
    end
    return largest_length_index.nil? ? [] : a[largest_length_index[0]..largest_length_index[1]]
  end
end

puts "#{Solution.new.lszero([1, 2, -2, 4, -4])}"
puts "#{Solution.new.lszero([1, 2, -3, 3])}"
puts "#{Solution.new.lszero([-19, 8, 2, -8, 19, 5, -2, -23])}"
puts "#{Solution.new.lszero([-1, 1, 1, -1, -1, 1, 1, -1])}"
puts "#{Solution.new.lszero([10, -3, -9, -10, 9, -26, 7, -2, -20, -19, -9, 7, 13, -5, -8, -24, -11, 28, 28, 24])}"
puts "#{Solution.new.lszero([15, -25, 10, -8, -15, 14, -11, 12, 25, 26, -15, -23, -7, -7, 20, 21, -7, -15])}"
puts "#{Solution.new.lszero([-8, 8, -1, -16, -28, -27, 15, -14, 14, -27, -5, -6, -25, -11, 28, 29, -3, -25, 17, -25, 4, -20, 2, 1, -17, -10, -25])}"
puts "#{Solution.new.lszero([0, 22, 7, 21, -11, -6, -7, -16, -2])}"