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
  while (i <= height)
    stars = i + (i - 1)
    space = height-i
    width = space + stars
    printed_space = 0
    while (1 <= width)
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


#  Print the following Star Pattern
#level=5
#    1
#   232
#  34543
# 4567654
#567898765

def print_palliandrome_numbers(height)
  return "Invalid Level, Level should be greater than 0" if height < 1

  i = 1
  while (i <= height)
    stars = i + (i - 1)
    space = height-i
    width = space + stars
    printed_space = 0
    j=i
    width_level=1
    while (width_level<=width)
      if printed_space != space
        print " "
        printed_space = printed_space+1
      else
        print j
        j = width_level >= height ? j -1 : j+1
      end
      width_level = width_level + 1;
    end
    puts "\n"
    i= i+1
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
  i = 1
  while(i <= height)
    j = 1
    start = i%2 == 0
    while(j <= i)
      print start == true ? "0 " : "1 "
      start = !start
      j = j+1
    end
    i = i+1
    puts "\n"
  end
end

puts print_stars(10)
puts print_binary(10)
puts print_palliandrome_numbers(5)