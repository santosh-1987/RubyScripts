=begin
Write a program to print maximum and minimum elements of the input array A of size N where you have to take integer N and other N elements as input from the user.
Input 1:

5 1 2 3 4 5

O/P: 5 1
Input 2:

4 10 50 40 80
O/P: 80 10
=end

def main()
  ip = gets.strip.split(" ").map(&:to_i)
  ip.shift
  puts "#{ip.max} #{ip.min}"
end

main