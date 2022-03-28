=begin
Write a program to print all odd numbers from 1 to N where you have to take N as input from user.



Problem Constraints

1 <= N <= 1000000



Input Format

A single line representing N




Output Format

All odd numbers from 1 to N separated by spaces.



Example Input

Input 1:

5
Input 2:

10


Example Output

Output 1:

1 3 5
Output 2:

1 3 5 7 9
=end
def main()
  num = gets.to_i

  1.upto(num).each do |i|
    print "#{i} " if (i >> 0) & 1 == 1
  end
end

main