if ARGV.length < 1
  puts "Too few arguments"
  exit
end

for i in 0 ... ARGV.length
   puts "#{i} #{ARGV[i]}"
end
