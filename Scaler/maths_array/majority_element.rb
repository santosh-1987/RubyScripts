=begin
Given an array of size N, find the majority element. The majority element is the element that appears more than floor(n/2) times.

You may assume that the array is non-empty and the majority element always exists in the array.

Problem Constraints
1 <= N <= 5*105
1 <= num[i] <= 109

Input Format
Only argument is an integer array.
Output Format
Return an integer.


Example Input
[2, 1, 2]
Example Output
2

Example Explanation
2 occurs 2 times which is greater than 3/2.
=end
require 'pry'

class Solution
  # @param a : constant array of integers
  # @return an integer
  def majorityElement(a)
    majority_count = {}
    a.each do |ele|
      majority_count[ele] = majority_count[ele].nil? ? 1 : majority_count[ele] + 1
    end
    majority_vote = a.length / 2
    majority_count.each_pair do |key, value|
      if value > majority_vote
        return key
      end
    end
  end

  def majority_by_greedy_algorithm(a)
    return a[0] if a.length == 1
    majority = nil
    count = 1
    majority = a[0]
    1.upto(a.length - 1).each do |idx|
      if majority.nil?
        majority = a[idx]
        count += 1
      elsif a[idx] == majority
        majority = a[idx]
        count += 1
      else
        count = count == 0 ? 0 : count - 1
        if count == 0
          majority = nil
        end
      end
    end
    return "No Majority" if count == 0 || majority == nil
    maj_count = 0

    for i in 0...a.length
      maj_count += 1 if a[i] == majority
    end
    if (maj_count > a.length / 2)
      return majority
    else
      return "No Majority"
    end
  end
end

puts Solution.new.majority_by_greedy_algorithm([2, 1, 2])
puts Solution.new.majority_by_greedy_algorithm([1, 1, 6, 1, 1, 2])
