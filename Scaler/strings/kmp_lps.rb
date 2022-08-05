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

puts "LPS for MAABHAIRABI is : #{"MAABHAIRABI".calculate_lps}"
puts "LPS for SANTOSH is : #{"SANTOSH".calculate_lps}"
puts "LPS for SHRADDHA is : #{"SHRADDHA".calculate_lps}"
puts "LPS for PRASANT is : #{"PRASANT".calculate_lps}"
puts "LPS for SUSANT is : #{"SUSANT".calculate_lps}"
puts "LPS for SOMONATH is : #{"SOMONATH".calculate_lps}"
puts "LPS for JYOTI is : #{"JYOTI".calculate_lps}"
puts "LPS for MOHANTY is : #{"MOHANTY".calculate_lps}"
puts "LPS for KANHU is : #{"KANHU".calculate_lps}"
puts "LPS for JAYRAM is : #{"JAYRAM".calculate_lps}"
puts "LPS for TIKI is : #{"TIKI".calculate_lps}"
puts "LPS for BHAIRAB is : #{"BHAIRAB".calculate_lps}"
puts "LPS for MAABHAIRABI is : #{"MAABHAIRABI".calculate_lps}"
puts "LPS for abcabdabcabeabcabdabcabc is : #{"abcabdabcabeabcabdabcabc".calculate_lps}"
