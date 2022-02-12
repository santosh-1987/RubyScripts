require 'pry'
# This needs to be fixed
def main(singing_minutes)
  # singing_minutes = gets.strip.split(" ").map(&:to_i)
  as, ae = [singing_minutes[0], singing_minutes[1]]
  bs, be = [singing_minutes[2], singing_minutes[3]]

  if as == bs && ae == be
    puts ae - as
  elsif as == bs && ae > be
    puts be - bs
  elsif as == bs && be > ae
    puts ae - as
  elsif as > bs && be >= ae
    puts ae - as
  elsif bs > as && be <= ae
    puts be - bs
  elsif bs > as && be > ae
    puts ae - bs
  elsif as < bs && ae < be
    puts be - as
  else
    puts 0
  end
end

singing_minutes1 = [3, 4, 1, 11] # 1
singing_minutes2 = [2, 5, 4, 6] # 1
singing_minutes3 = [5, 6, 0, 5] # 0
singing_minutes4 = [7, 12, 8, 13] # 4
singing_minutes5 = [3, 8, 6, 14] # 2
singing_minutes6 = [0, 6, 0, 6] # 6
singing_minutes7 = [0, 0, 0, 1] # 0
singing_minutes8 = [0, 0, 0, 0] # 0

main(singing_minutes1)
main(singing_minutes2)
main(singing_minutes3)
main(singing_minutes4)
main(singing_minutes5)
main(singing_minutes6)
main(singing_minutes7)
main(singing_minutes8)
