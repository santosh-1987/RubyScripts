=begin
You are given an integer N you need to print all the Armstrong Numbers between 1 to N.

If sum of cubes of each digit of the number is equal to the number itself, then the number is called an Armstrong number.

For example, 153 = ( 1 * 1 * 1 ) + ( 5 * 5 * 5 ) + ( 3 * 3 * 3 ).
=end
class Armstrong

  def self.print_armstrong(limit)
    for i in (1..limit)
      num_arr = i.to_s.split('').map(&:to_i)
      if i == num_arr.map { |num| pow(num, 3) }.inject(:+)
        puts i
      end
    end
  end

  def self.pow(a, b)
    count = 1
    1.upto(b) do |_|
      count *= a
    end
    return count
  end

end

Armstrong.print_armstrong(500)