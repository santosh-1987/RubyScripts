=begin
Problem Description

Write a program to input T numbers(N) from user and print count of digits of the given numbers.



Problem Constraints

1 <= T <= 100

0 <= N <= 100000000



Input Format

First line is T which means number of test cases.

Each next N lines contain an integer N.



Output Format

T lines each containing count of digits of the input integer.



Example Input

Input 1:

2
0
1
Input 2:

2
100
10101


Example Output

Output 1:

1
1
Output 2:

3
5


Example Explanation

Explanation 1:

0 and 1 both have only one digit.
Explanation 2:

100 has two digits and 10101 has 5 digits.

=end

def main()
  count = gets.to_i
  while count >= 1
    num = gets.strip
    puts num.split("").count # Alternative gets.to_i.digits.count
    count -= 1
  end
end

main