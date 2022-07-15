=begin
Problem Description
Given an integer A.

Compute and return the square root of A.

If A is not a perfect square, return floor(sqrt(A)).

DO NOT USE SQRT FUNCTION FROM THE STANDARD LIBRARY.

NOTE: Do not use the sqrt function from the standard library. Users are expected to solve this in O(log(A)) time.

Java:

public class Solution {
   public int sqrt(int A) {
      int low = 1, high = A, root = 0;
      while (low <= high) {
         int mid = (low + high) / 2;
         if (mid == A / mid && (A % mid == 0))
            return mid;
         if (mid <= A / mid) {
            root = mid;
            low = mid + 1;
         } else {
            high = mid - 1;
         }
      }
      return root;
   }
}
=end

class Solution
  # @param a : integer
  # @return an integer
  def sqrt(a)
    return a if a == 0 || a == 1
    left = 1
    right = a
    ans = nil
    while (left <= right)
      mid = (left + right) / 2

      if mid * mid == a
        return mid
      end
      if mid * mid > a
        right = mid - 1
      else
        left = mid + 1
        ans = mid
      end
    end
    return ans
  end
end

puts Solution.new.sqrt(32)