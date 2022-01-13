=begin
Problem Description

Write a program to input T numbers(N) from user and find reverse of the given number.



Problem Constraints

1 <= T <= 100

1 <= N <= 100000000



Input Format

First line is T which means number of test cases.

Each next N lines contain an integer N.



Output Format

T lines each containing reverse of the input integer.



Example Input

Input 1:

2
101
105
Input 2:


1
100


Example Output

Output 1:

101
501
Output 2:

1


Example Explanation

Explanation 1:

Reverse(101)=101
Reverse(105)=501
Explanation 2:

Reverse(100)=001=1
HINT:
Keep dividing the number with 10 and store remainder one by one.
Run a loop until the number becomes 0.
=end

def main()
  count = gets.to_i
  while count >= 1
    num = gets
    new_num = []
    num_arr = num.split("")
    num_arr.length.downto(0) do |digit|
      new_num << num_arr[digit]
    end
    puts new_num.join("").to_i
    count -= 1
  end
end

main