ARGF.each do |line|
  puts "\n#{ARGF.filename}:" if ARGF.file.lineno == 1
  puts line
end
