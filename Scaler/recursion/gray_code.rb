=begin
The gray code is a binary numeral system where two successive values differ in only one bit.

Given a non-negative integer A representing the total number of bits in the code, print the sequence of gray code.

A gray code sequence must begin with 0.

Problem Constraints

1 <= A <= 16

Input Format

The first argument is an integer A.

Output Format

Return an array of integers representing the gray code sequence.

Example Input

Input 1:

A = 2
Input 1:

A = 1

Example Output

output 1:

[0, 1, 3, 2]
output 2:

[0, 1]

Example Explanation

Explanation 1:

for A = 2 the gray code sequence is:
    00 - 0
    01 - 1
    11 - 3
    10 - 2
So, return [0,1,3,2].
Explanation 1:

for A = 1 the gray code sequence is:
    00 - 0
    01 - 1
So, return [0, 1].

Java:
public class Solution {
	public ArrayList<Integer> grayCode(int a) {
		ArrayList<Integer> al=new ArrayList<>();
        //base condition
        if(a==1)
        {
            al.add(0);
            al.add(1);
            return al;
        }
        ArrayList<Integer> ans=grayCode(a-1);
        al.addAll(ans);

        for(int i=al.size()-1;i>=0;i--)
        {
            al.add(ans.get(i)+(1<<(a-1)));
             System.out.print(al);
        }

        return al;
	}
}

=end

