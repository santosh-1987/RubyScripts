=begin
You are given a function to_lower() which takes a character array A as an argument.

Convert each character of A into lowercase character if it exists. If the lowercase of a character does not exist, it remains unmodified.
The uppercase letters from A to Z is converted to lowercase letters from a to z respectively.

Return the lowercase version of the given character array.

Problem Constraints
1 <= |A| <= 105

Input Format
Only argument is a character array A.

Output Format
Return the lowercase version of the given character array.

Example Input
Input 1:

 A = ['S', 'c', 'A', 'l', 'e', 'r', 'A', 'c', 'a', 'D', 'e', 'm', 'y']
Output 1:

 ['s', 'c', 'a', 'l', 'e', 'r', 'a', 'c', 'a', 'd', 'e', 'm', 'y']
Input 2:

 A = ['S', 'c', 'a', 'L', 'e', 'r', '#', '2', '0', '2', '0']
Output 2:

 ['s', 'c', 'a', 'l', 'e', 'r', '#', '2', '0', '2', '0']

Example Explanation
Explanation 1:

 All the characters in the returned array are in lowercase alphabets.
=end

class Solution
  # @param a : array of characters
  # @return an array of characters
  def to_lower(a)
    range = ('A'.. 'Z')
    0.upto(a.length - 1).each do |idx|
      char = a[idx]
      if range.include?(char)
        a[idx] = (char.ord |(1 << 5)).chr
      end
    end
    return a
  end
end

puts "#{Solution.new.to_lower(['S', 'c', 'a', 'L', 'e', 'r', '#', '2', '0', '2', '0'])}"

"n l e v g v r e a h m o f ? s z w f ` s ? h x b y s m o w k l d t @ g d p w e g i s h o l b d q o q k t m c g g m n h v g l { a b c x w b x e = d i a c y e x p j x e"
"n l e v g v r e a h m o f ? s z w f ` s ? h x b y s m o w k l d t ` g d p w e g i s h o l b d q o q k t m c g g m n h v g l { a b c x w b x e = d i a c y e x p j x e"
