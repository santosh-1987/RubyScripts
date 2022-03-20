puts "Input a String"
str = gets.strip
puts "#{str.strip.downcase.gsub(' ', '_')}.rb"