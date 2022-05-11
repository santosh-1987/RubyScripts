=begin
Write a recursive function that, given a string S, prints the characters of S in reverse order.
Example Input

Input 1:

 scaleracademy
Input 2:

 cool


Example Output

Output 1:

 ymedacarelacs
Output 2:

 looc
=end

def rev_string(str)
  return if str.length == 0
  char = str[0]
  rev_string(str[1..-1])
  print char
end

rev_string("scaleracademy")