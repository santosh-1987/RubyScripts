=begin

 Pairs With Given Xor
Given an integer array A containing N distinct integers.

Find the number of unique pairs of integers in the array whose XOR is equal to B.

NOTE:

Pair (a, b) and (b, a) is considered to be the same and should be counted once.


Problem Constraints
1 <= N <= 105

1 <= A[i], B <= 107



Input Format
The first argument is an integer array A.

The second argument is an integer B.



Output Format
Return a single integer denoting the number of unique pairs of integers in the array A whose XOR is equal to B.



Example Input
Input 1:

 A = [5, 4, 10, 15, 7, 6]
 B = 5
Input 2:

 A = [3, 6, 8, 10, 15, 50]
 B = 5


Example Output
Output 1:

 1
Output 2:

 2


Example Explanation
Explanation 1:

 (10 ^ 15) = 5
Explanation 2:

 (3 ^ 6) = 5 and (10 ^ 15) = 5


Java:

public class Solution {
    public int solve(ArrayList<Integer> A, int B) {
        HashSet<Integer> hset=new HashSet<>();
        //Hashing Approach
        int cnt=0,xor=0;
        for(int i=0;i<A.size();i++)
        {
            xor=A.get(i)^B;
            if(!hset.contains(xor))
            {
                hset.add(A.get(i));
            }
            else
            {
                cnt++;
            }
        }
        System.out.println(hset);
        return cnt;
        /*brute force approach
        int cnt=0,xor=0;
        for(int i=0;i<A.size();i++)
        {
            for(int j=i+1;j<A.size();j++)
            {
            xor=A.get(i)^A.get(j);
            if(xor==B)
            {
                cnt++;
            }
            }
        }
        return cnt;
        */
    }
}
=end

require 'set'

class Solution
  # @param a : array of integers
  # @param b : integer
  # @return an integer
  def solve(a, b)
    count = 0
    set = Set.new
    for i in 0...a.length
      if !set.include?(a[i] ^ b)
        set.add(a[i])
      else
        count += 1
      end
    end
    return count
  end

  def brute_force(a, b)
    count = 0
    for i in 0...a.length - 1
      for j in i + 1...a.length
        puts "(#{a[i]},#{a[j]})"
        count += 1 if a[i] ^ a[j] == b
      end
    end
    return count

  end
end

puts Solution.new.solve([5, 4, 10, 15, 7, 6], 5)