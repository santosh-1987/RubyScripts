require "pry"
def solution(a, k, l)
  return -1 if k == l
  alice = a.each_cons(k).max_by { |ele| ele.inject(:+) }.reduce(:+)
  bob = a.each_cons(l).max_by { |ele| ele.inject(:+) }.reduce(:+)
  return alice + bob
end

solution([6,1,4,6,3,2,7,4],3,2)