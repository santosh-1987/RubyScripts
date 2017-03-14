=begin
Character Count with Index Position in Ruby

E.g:  "Santosh Kumar Mohanty"
{"S"=>[0], "a"=>[1, 11, 17], "n"=>[2, 18], "t"=>[3, 19], "o"=>[4, 15], "s"=>[5], "h"=>[6, 16], " "=>[7, 13], "K"=>[8], "u"=>[9], "m"=>[10], "r"=>[12], "M"=>[14], "y"=>[20]}

S has 1 values at Index 0
a has 3 values at Index 1,11,17
n has 2 values at Index 2,18
t has 2 values at Index 3,19
o has 2 values at Index 4,15
s has 1 values at Index 5
h has 2 values at Index 6,16
  has 2 values at Index 7,13
K has 1 values at Index 8
u has 1 values at Index 9
m has 1 values at Index 10
r has 1 values at Index 12
M has 1 values at Index 14
y has 1 values at Index 20

=end

require "pry"
class Charcount
  def initialize(string)
    @string = string
  end
  def count_char
    return "Invalid String" if @string.length == 0
    result_hash = {}
    @string.split("").each_with_index do |value,index|
      result_hash[value] = [] if result_hash[value].nil?
      result_hash[value] <<  index
    end
    return to_string(result_hash)
  end

  def to_string(result_hash)
    str = String.new
    return result_hash.map { |key,value| (str + "#{key} has #{value.count} values at Index #{value.join(",")}\n" ) }.join().strip
  end
end

c = Charcount.new("Santosh Kumar Mohanty")
puts c.count_char