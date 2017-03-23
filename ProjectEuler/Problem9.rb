=begin
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=end

class Pythagorean
  def self.triplet_for(sum)
   for base in 1..sum/3
     for height in 1..sum/2
       hyp = sum - height - base
        if height**2 + base**2 == hyp**2
          return "Height , Base & Hypotenous & Product is #{height}, #{base}, #{hyp},#{height*base*hyp}"
        end
     end
   end
  end
end

print Pythagorean.triplet_for(1000)

# >> Height , Base & Hypotenous & Product is 375, 200, 425,31875000
