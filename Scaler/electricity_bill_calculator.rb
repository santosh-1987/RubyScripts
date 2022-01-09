require 'pry'
=begin
Problem Description

Given an integer A denoting the amount of units of electricity consumed, you have to calculate the electricity bill (in Rs.) with the help of the below charge conditions:

For first 50 units Rs. 0.50/unit
For next 100 units Rs. 0.75/unit
For next 100 units Rs. 1.20/unit
For unit above 250 Rs. 1.50/unit
An additional surcharge of 20% is added to the bill.

NOTE: As the electricity bill can have any real value (floating point), you have to tell the floor value of the bill.

Floor value of a floating point is the closest integer less than or equal to that value. For eg, Floor value of 2.91 is 2.



Problem Constraints

1 <= A <= 500



Input Format

First line of the input contains a single integer A.



Output Format

Print an integer denoting the floor value of the Electricity bill.



Example Input

Input 1:

 150
Input 2:

 4


Example Output

Output 1:

 120
Output 2:

 2


Example Explanation

Explanation 1:

 For first 50 units, the bill is (Rs 0.5/unit) * (50 unit) = Rs 25
 For next 100 units, the bill is (Rs 0.75/unit) * (100 unit) = Rs 75
 Bill amount without additional surcharge = Rs 100
 Total Bill amount with additional surcharge = Rs (100 + 0.20 * 100) = Rs 120
Explanation 2:

 Bill without additional surcharge (Rs 0.5/unit) * (4 unit) = Rs 2
 Total Bill amount with additional surcharge = Rs (2 + 0.20 * 2) = Rs 2.4
 Floor value of Bill amount = Rs 2
=end

def main()
  puts "Enter Unit:"
  consumed_unit = gets.to_i
  return 0 if consumed_unit <= 0
  bill = 0
  unit_details = { 1..50 => 0.5, 51..150 => 0.75, 151..250 => 1.2, 251..Float::INFINITY => 1.5 }
  unit_details.each_pair do |unit, rate|
    break if consumed_unit < 0
    units = unit.max == Float::INFINITY ? consumed_unit : unit.count
    if consumed_unit > units
      bill += rate * units
    else
      bill += rate * consumed_unit
    end
    consumed_unit -= units
  end
  bill += bill * 0.2
  return bill.to_i
end

def bill_calculator
  puts "Enter Unit:"
  consumed_unit = gets.to_i
  return 0 if consumed_unit <= 0
  bill = 0
  if consumed_unit <= 50
    bill += consumed_unit * 0.5
  elsif (consumed_unit > 50 && consumed_unit <= 150)
    bill += 25 + ((consumed_unit - 50) * 0.75)
  elsif (consumed_unit > 150 && consumed_unit <= 250)
    bill += 100 + ((consumed_unit - 150) * 1.2)
  else
    bill += 220 + ((consumed_unit - 250) * 1.5)
  end
  bill += bill*0.2
  return bill.to_i
end

puts main == bill_calculator