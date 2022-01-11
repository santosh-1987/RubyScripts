require 'pry'
=begin
  Print the following Star Pattern

level=4
      *
    * * *
  * * * * *
* * * * * * *
=end

def print_stars(height)
  return "Invalid Level, Level should be greater than 0" if height < 1

  i = 1
  while i <= height
    stars = i + (i - 1) # can use (2i-1) AP formula
    space = height - i
    width = space + stars
    printed_space = 0
    while 1 <= width
      if printed_space != space
        print " "
        printed_space = printed_space + 1
      else
        print "*"
      end
      width = width - 1;
    end
    puts "\n"
    i = i + 1
  end
end

#  Print the following Number Pattern
#level=5
#    1
#   232
#  34543
# 4567654
#567898765

def print_palliandrome_numbers(height)
  return "Invalid Level, Level should be greater than 0" if height < 1

  current_height = 1
  while current_height <= height
    numbers = current_height + (current_height - 1)
    space = height - current_height
    width = space + numbers
    printed_space = 0
    number_to_print = current_height
    width_level = 1
    while width_level <= width
      if printed_space != space
        print " "
        printed_space = printed_space + 1
      else
        print number_to_print
        number_to_print = width_level >= height ? number_to_print - 1 : number_to_print + 1
      end
      width_level = width_level + 1
    end
    puts "\n"
    current_height = current_height + 1
  end
end

=begin
height = 10

1
0 1
1 0 1
0 1 0 1
1 0 1 0 1
0 1 0 1 0 1
1 0 1 0 1 0 1
0 1 0 1 0 1 0 1
1 0 1 0 1 0 1 0 1
0 1 0 1 0 1 0 1 0 1

=end
def print_binary(height)
  current_height = 1
  while current_height <= height
    current_width = 1
    print_zero = current_height % 2 == 0
    while current_width <= current_height
      print print_zero == true ? "0 " : "1 "
      print_zero = !print_zero
      current_width = current_width + 1
    end
    current_height = current_height + 1
    puts
  end
end

=begin
print following pattern:

A
B B
C C C
=end

def print_char(level)
  start = "A"
  for i in 1..level
    for j in 1..i
      print "#{start}"
      print " " if i != j
    end
    puts
    start = start.next
  end
end

def print_num(level)
  for i in 1..level
    for j in 1..i
      print j
      print " " if i != j
    end
    puts
  end
end

def inverted_pyramid
  level = gets.to_i
  level.downto(1) do |i|
    for j in 1..i
      print j
      print " " if i != j
    end
    puts
  end
end

def sum_of_even_numbers_between(num)
  # The sum of all even numbers 1 to 100 can be found by using the formula, S=n(n+1), where n is the total number of even numbers from 1 to 100.
  even_numbers = num / 2
  sum = even_numbers * (even_numbers + 1)
  return sum
end

=begin
Given an integer N, print the corresponding Full Numeric Pyramid pattern for N.

For example if N = 5 then pattern will be like:

0 0 0 0 1 0 0 0 0
0 0 0 2 3 2 0 0 0
0 0 3 4 5 4 3 0 0
0 4 5 6 7 6 5 4 0
5 6 7 8 9 8 7 6 5

NOTE: There should be exactly one extra space after each number for each row.
=end

def full_numberic_pyramid
  height = gets.to_i
  width = (2 * height) - 1
  for i in 1..height
    digit = i
    for j in 1..width
      start = (width/2) - (i-1)
      start = (width/2) - (i-1)
      if j > start && j <= width - start
        print "#{digit}"
        digit = width/2 < j ? digit - 1 : digit + 1
      else
        print "0"
      end
      print " "
    end
    puts unless i == j
  end
end

# puts print_stars(10)
# puts print_binary(3)
# puts print_palliandrome_numbers(5)
full_numberic_pyramid