=begin
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
=end
require "rubygems"
require "pry"

class Sequence
  def initialize
    raise "Class cannot be Implemented !!!"
  end

  def generate_even_seq(num)
    return validate_number(num).nil? ? "Invalid Number" : num/2
  end

  def generate_odd_seq(num)
    return validate_number(num).nil? ? "Invalid Number" : 3*num + 1
  end

  private
  def validate_number(num)
    begin
      num = Integer(num)
      return num
    rescue ArgumentError => e
      return nil
    end
  end
end

class IterativeSequence < Sequence
  attr_accessor :current_num,:seq
  def initialize(num)
    raise "Invalid Number" unless num.is_a?(Fixnum) && num.positive?
    @current_num = num
    @seq = Array.new(1){@current_num}
  end

  def generate_seq
    while @current_num > 1 do
      @current_num = @current_num.even? ? generate_even_seq(@current_num) : generate_odd_seq(@current_num)
      if @current_num.is_a? Fixnum
        @seq << @current_num
      else
        puts "Error while generating Sequence, Invalid I/P String"
      end
    end
    return @seq
  end
end

class LargestSequenceNumber
  def self.find_from(limit)
    return "Limit must be greater than 1 " if limit <= 1
    hash = {}
    for i in 1..limit
      iSeq = IterativeSequence.new(i)
      hash[i] = iSeq.generate_seq.count
    end
    sorted_hash = hash.sort_by{ |k,v| v}.reverse.to_h
    key,value = sorted_hash.first
    return sorted_hash.select {|k,v| v == value}.sort.to_h
  end
end
puts "Enter a limit to find largest Sequence Number: "
ip=gets.to_i
puts LargestSequenceNumber.find_from(ip)
