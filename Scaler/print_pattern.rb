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
    stars = i + (i - 1)
    space = height-i
    width = space + stars
    printed_space = 0
    while 1 <= width
      if printed_space != space
        print " "
        printed_space = printed_space+1
      else
        print "*"
      end
      width = width - 1;
    end
    puts "\n"
    i= i+1
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
    space = height-current_height
    width = space + numbers
    printed_space = 0
    number_to_print=current_height
    width_level=1
    while width_level <= width
      if printed_space != space
        print " "
        printed_space = printed_space+1
      else
        print number_to_print
        number_to_print = width_level >= height ? number_to_print-1 : number_to_print+1
      end
      width_level = width_level + 1
    end
    puts "\n"
    current_height= current_height+1
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
    print_zero = current_height%2 == 0
    while current_width <= current_height
      print print_zero == true ? "0 " : "1 "
      print_zero = !print_zero
      current_width = current_width+1
    end
    current_height = current_height+1
    puts
  end
end

# puts print_stars(10)
# puts print_binary(10)
puts print_palliandrome_numbers(5)