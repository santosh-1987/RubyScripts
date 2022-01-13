=begin
Problem Description

Given an integer A, determine whether it is palindromic or not.

A palindrome integer is an integer X for which reverse(X) = X where reverse(X) is X with its digits reversed. For e.g., reverse(123) = 321.



Problem Constraints

1 <= A <= 106



Input Format

First and the only line contains a single integer A.



Output Format

Print Yes if it is palindromic, else print No.



Example Input

Input 1:

 120
Input 2:

 1001
Input 3:

 131


Example Output

Output 1:

 No
Output 2:

 Yes
Output 3:

 Yes


Example Explanation

Explanation 1:

 For A = 120, reverse(A) = reverse(120) = 021 = 21 (removing leading zeroes). 120 is not equal to 21
Explanation 2:

 For A = 1001, reverse(A) = reverse(1001) = 1001, which is same as A.
Explanation 3:

 For A = 131, reverse(A) = reverse(131) = 131, which is same as A.
=end

def main()
  num = gets.to_i
  orig_number = num
  reverse_number = ""
  while num > 0
    reverse_number += (num % 10).to_s
    num = num / 10
  end
  puts reverse_number == orig_number.to_s ? "Yes" : "No"
end

main