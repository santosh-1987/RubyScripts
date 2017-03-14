module A
  def a_method
    puts "From MOD A"
  end
end

module B
  def a_method
    puts "From Mod B"
  end
end


class Ab
  def a_method
    puts "From Class A"
  end
end

class Baba < Ab
   extend A
   extend B
  def a_method
     puts "From Class B"
   end
end


Baba.a_method