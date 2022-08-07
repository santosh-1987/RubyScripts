=begin
Build a LPS array for a Given String
=end

class String
  def calculate_lps
    lps = Array.new(self.length)
    lps[0] = 0
    for i in 1...self.length
      x = lps[i - 1]
      if self[x] == self[i]
        lps[i] = x + 1
      else
        while self[x] != self[i]
          if x == 0
            x = x - 1 # this is done because we do lps[i] = x + 1 in line 22
            break
          end
          x = lps[x - 1]
        end
      end
      lps[i] = x + 1
    end
    return lps
  end
end

puts "LPS for abcabcxyzxyz is : #{"abcabcxyzxyz".calculate_lps}"
puts "LPS for bb#b is : #{"bb#b".calculate_lps}"

