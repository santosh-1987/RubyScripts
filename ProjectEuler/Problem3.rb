=begin
https://projecteuler.net/problem=3
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=end
def prime_factors(number)
  prime_array = []
  p = 2
  return p if number < 2
  loop do
    result = fetch_prime(number)
    break if result.empty?
    number = result[1]
    prime_array << result[0]
  end
  return prime_array
end

def fetch_prime(number)
  prime = []
  start=2
   while start <= number
    if number%start == 0
      prime = [start,number/start]
      break
    end
    start += 1
   end
   return prime
end
# print fetch_prime(13195)
print prime_factors(600851475143)

# >> [71, 839, 1471, 6857]
