=begin
Problem Description

Given an integer A, you have to tell whether it is a prime number or not.

A prime number is a natural number greater than 1 which is divisible only by 1 and itself.



Problem Constraints

1 <= A <= 106



Input Format

First and only line of the input contains a single integer A.



Output Format

Print YES if A is a prime, else print NO.



Example Input

Input 1:

 3
Input 2:

 4


Example Output

Output 1:

 YES
Output 2:

 NO


Example Explanation

Explanation 1:

 3 is a prime number as it is only divisible by 1 and 3.
Explanation 2:

 4 is not a prime number as it is divisible by 2.
=end

# Points to be Noted
#   Numbers having even numbers in one’ place cannot be a prime number.
#
#   Only 2 is an even prime number; all the rest prime numbers are odd numbers.
#
#   To find whether a larger number is prime or not, add all the digits in a number, if the sum is divisible by 3 it is not a prime number.
#
#   Except 2 and 3, all the other prime numbers can be expressed in the general form as    6n + 1 or 6n - 1, where n is the natural number.
# https://stackoverflow.com/questions/5811151/why-do-we-check-up-to-the-square-root-of-a-prime-number-to-determine-if-it-is-pr
# You can also go upto n/2 in loop to find if a number is divisbile , but square root tip is more fast
def main()
  num = gets.to_i

  if (num == 1 || num == 2 || num == 3 || num == 5)
    puts("YES")
  elsif ((num % 10) % 2 == 0)
    puts "NO" # Numbers having even numbers in one’ place cannot be a prime number.
  elsif(num.to_s.split("").map(&:to_i).inject(:+) % 3 == 0)
    puts "NO"
  else
    limit = num/2
    prime = "YES"
    (2..limit).each do |divisor|
      if(num%divisor == 0)
        prime = "NO"
        break
      end
    end
    puts prime
  end
end

main