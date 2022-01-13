def fylfot(length)
  raise "Enter only odd number and number >= 5" if length % 2 == 0 || length < 5
  for i in 0...length
    for j in 0...length
      if i == length / 2 || j == length / 2 # Main line
        print "* "
      elsif i == j && i == 0 || i == j && i == length - 1 # LU & RL corner
        print "* "
      elsif (i == 0 && j == length - 1) || (j == 0 && i == length - 1) # RU && LL
        print "* "
      elsif i == 0 && j > length / 2 || j == 0 && i < length / 2
        print "* "
      elsif i == length - 1 && j < length / 2 || j == length - 1 && i > length / 2
        print "* "
      else
        print "  "
      end
    end
    puts
  end
end

[5, 7, 9, 11].each do |num|
  fylfot(num)
end
