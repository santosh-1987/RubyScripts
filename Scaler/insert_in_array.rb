def insert()
  # num_of_elements = gets.to_i
  elements = [1, 2, 3, 4, 5] #gets.strip.split(" ").map(&:to_i)
  pos_to_insert = 3 #gets.to_i
  element_to_insert = 2 #gets.to_i

  if pos_to_insert == 1
    ([element_to_insert] + elements).each do |ele|
      print "#{ele} "
    end
  else
    new_arr = [element_to_insert]
    elements[pos_to_insert - 1..elements.size].each do |ele|
      new_arr << ele
    end
    (elements[0...pos_to_insert - 1] + new_arr).each do |ele|
      print "#{ele} "
    end
  end
end

insert
