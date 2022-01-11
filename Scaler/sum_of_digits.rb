=begin
Problem Description

Write a program to input T numbers(N) from user and print the sum of the digits of the given numbers.



Problem Constraints

1 <= T <= 1000

0 <= N <= 100000000



Input Format

First line is T which means number of test cases.

Each next T lines contain an integer N.



Output Format

T lines each containing one integer representing sum of the digits of the input integer.



Example Input

Input 1:

2
5
1001
Input 2:

2
123
1589


Example Output

Output 1:

5
2
Output 2:

6
23


Example Explanation

Explanation 1:

5 has only 1 digit hence sum is 5.
Sum(1001) = 1+0+0+1 = 2.
Explanation 2:

Explanation 2:
Sum(123) = 1+2+3 = 6.
Sum(1589) = 1+5+8+9 = 23.

=end

def main()
  num_of_transcation = gets.to_i

  while(num_of_transcation >=1)
    number = gets
    puts number.split("").map(&:to_i).inject(:+)
    num_of_transcation -= 1
  end
end

main