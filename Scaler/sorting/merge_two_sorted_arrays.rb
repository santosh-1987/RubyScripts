=begin
Problem Description
Given two sorted integer arrays A and B, merge B and A as one sorted array and return it as an output.

Problem Constraints
-10^10 <= A[i], B[i] <= 10^10


Input Format
First Argument is a 1-D array representing A.

Second Argument is also a 1-D array representing B.

Output Format
Return a 1-D vector which you got after merging A and B.

Example Input
Input 1:

A = [4, 7, 9 ]
B = [2, 11, 19 ]
Input 2:

A = [1]
B = [2]


Example Output
Output 1:

[2, 4, 7, 9, 11, 19]
Output 2:

[1, 2]


Example Explanation
Explanation 1:

Merging A and B produces the output as described above.
Explanation 2:

 Merging A and B produces the output as described above.

Java:

public class Solution {
    // DO NOT MODIFY THE LIST. IT IS READ ONLY
    public ArrayList < Integer > solve(final List < Integer > A, final List < Integer > B) {
        int m = A.size(), n = B.size();
        ArrayList < Integer > res = new ArrayList < Integer > ();
        if (A == null && B == null)
            return null;
        if (A == null) {
            for (int i = 0; i < n; i++)
                res.add(B.get(i));
            return res;
        }
        if (B == null) {
            for (int i = 0; i < m; i++)
                res.add(A.get(i));
            return res;
        }
        int i, j;
        int k = 0;
        for (i = 0, j = 0; k < m + n; k++) {
            if (i >= m)
                res.add(B.get(j++));
            else if (j >= n)
                res.add(A.get(i++));
            else if (A.get(i) <= B.get(j))
                res.add(A.get(i++));
            else
                res.add(B.get(j++));
        }
        return res;
    }
}
=end

require 'pry'

class Solution
  # @param a : constant array of integers
  # @param b : constant array of integers
  # @return an array of integers
  def solve(a, b)
    i = 0
    j = 0
    c = []

    while a[i] != nil && b[j] != nil
      if a[i] < b[j]
        c << a[i]
        i += 1
      else
        c << b[j]
        j += 1
      end
    end

    if a[i] != nil
      c = c + a[i..a.length-1]
    end

    if b[j] != nil
      c = c + b[j..b.length-1]
    end

    return c
  end
end

print Solution.new.solve([4, 7, 9], [2, 11, 19])