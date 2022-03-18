=begin
Question Overview
You are given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
Example
Input: [-2,1,-3,4,-1,2,1,-5,4],
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6
#https://chenyunzhang.medium.com/find-the-maximum-subarray-with-ruby-approach-1174aee76c2c
=end
require 'pry'
def max_sub_array(nums)
  largest_sum, current = nums[0], 0
  nums.each do |x|
    largest_sum = [largest_sum, current = [x, current + x].max].max
  end
  largest_sum
end

print max_sub_array([-2,1,-3,4,-1,2,1,-5,4])