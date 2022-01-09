=begin
Problem Description

Write a program to input three numbers(A, B & C) from user and print the maximum element among A, B & C in each line.



Problem Constraints

1 <= A <= 1000000

1 <= B <= 1000000

1 <= C <= 1000000



Input Format

One line containing three space separated integers A, B & C.



Output Format

One line containing an integer as per the question.



Example Input

Input 1:

5 6 7
Input 2:

1000 10000 100000


Example Output

Output 1:

7
p>Output 2:

100000


Example Explanation

Explanation 1:

Clearly, among 5, 6 and 7, 7 is maximum.
Explanation 2:

Clearly, among 1000, 10000 and 100000, 100000 is maximum.

=end
def main()
  number_string = gets
  numbers = number_string.split(" ").map(&:to_i)
  largest_num = numbers[0]
  numbers.each do |num|
    largest_num = num if  num > largest_num
  end
  puts largest_num
end

main